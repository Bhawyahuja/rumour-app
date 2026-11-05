import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rumour/core/constants/app_constants.dart';
import 'package:rumour/features/chat/data/dtos/message_dto.dart';

typedef MessageSnapshot = ({MessageDto dto, bool isPending});


typedef MessageWindowSnapshot = ({List<MessageSnapshot> items, bool fromCache});

abstract interface class ChatRemoteDataSource {
  /// Newest [limit] messages, newest first. Re-emits on every change,
  /// including local (pending) writes.
  Stream<MessageWindowSnapshot> watchLatest(String code, {required int limit});

  /// Up to [limit] messages strictly older than [before], newest first.
  Future<List<MessageSnapshot>> fetchBefore(
    String code, {
    required DateTime before,
    required int limit,
  });

  Future<void> send(
    String code, {
    required String senderId,
    required String senderAlias,
    required String text,
  });
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  const ChatRemoteDataSourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  DocumentReference<Map<String, dynamic>> _room(String code) =>
      _firestore.collection(FirestorePaths.rooms).doc(code);

  CollectionReference<Map<String, dynamic>> _messages(String code) =>
      _room(code).collection(FirestorePaths.messages);

  static MessageSnapshot _map(QueryDocumentSnapshot<Map<String, dynamic>> d) =>
      (
        dto: MessageDto.fromJson({...d.data(), 'id': d.id}),
        isPending: d.metadata.hasPendingWrites,
      );

  @override
  Stream<MessageWindowSnapshot> watchLatest(String code, {required int limit}) {
    return _messages(code)
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots(includeMetadataChanges: true)
        .map(
          (q) => (
            items: q.docs.map(_map).toList(growable: false),
            fromCache: q.metadata.isFromCache,
          ),
        );
  }

  @override
  Future<List<MessageSnapshot>> fetchBefore(
    String code, {
    required DateTime before,
    required int limit,
  }) async {
    final q = await _messages(code)
        .orderBy('createdAt', descending: true)
        .startAfter([Timestamp.fromDate(before)])
        .limit(limit)
        .get();
    return q.docs.map(_map).toList(growable: false);
  }

  @override
  Future<void> send(
    String code, {
    required String senderId,
    required String senderAlias,
    required String text,
  }) {
    final messageRef = _messages(code).doc();
    final batch = _firestore.batch()
      ..set(messageRef, {
        'text': text,
        'senderId': senderId,
        'senderAlias': senderAlias,
        'createdAt': FieldValue.serverTimestamp(),
        'clientCreatedAt': Timestamp.now(),
      })
      ..update(_room(code), {'lastMessageAt': FieldValue.serverTimestamp()});
    return batch.commit();
  }
}
