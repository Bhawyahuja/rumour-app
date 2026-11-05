import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rumour/core/constants/app_constants.dart';
import 'package:rumour/features/room/data/dtos/member_dto.dart';
import 'package:rumour/features/room/data/dtos/room_dto.dart';

abstract interface class RoomRemoteDataSource {
  Stream<RoomDto?> watchRoom(String code);

  Future<MemberDto?> getMember({required String code, required String userId});

  Future<bool> isAliasTaken({required String code, required String alias});

  Future<MemberDto> joinRoom({
    required String code,
    required String userId,
    required String alias,
    required String handle,
  });
}

class RoomRemoteDataSourceImpl implements RoomRemoteDataSource {
  const RoomRemoteDataSourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  DocumentReference<Map<String, dynamic>> _roomRef(String code) =>
      _firestore.collection(FirestorePaths.rooms).doc(code);

  CollectionReference<Map<String, dynamic>> _membersRef(String code) =>
      _roomRef(code).collection(FirestorePaths.members);

  @override
  Stream<RoomDto?> watchRoom(String code) {
    return _roomRef(code).snapshots().map((snap) {
      final data = snap.data();
      if (!snap.exists || data == null) return null;
      return RoomDto.fromJson({...data, 'code': snap.id});
    });
  }

  @override
  Future<MemberDto?> getMember({
    required String code,
    required String userId,
  }) async {
    final snap = await _membersRef(code).doc(userId).get();
    final data = snap.data();
    if (!snap.exists || data == null) return null;
    return MemberDto.fromJson({...data, 'userId': snap.id});
  }

  @override
  Future<bool> isAliasTaken({
    required String code,
    required String alias,
  }) async {
    final query = await _membersRef(
      code,
    ).where('alias', isEqualTo: alias).limit(1).get();
    return query.docs.isNotEmpty;
  }

  @override
  Future<MemberDto> joinRoom({
    required String code,
    required String userId,
    required String alias,
    required String handle,
  }) {
    final roomRef = _roomRef(code);
    final memberRef = _membersRef(code).doc(userId);

    return _firestore.runTransaction<MemberDto>((tx) async {
      final roomSnap = await tx.get(roomRef);
      final memberSnap = await tx.get(memberRef);

      final existing = memberSnap.data();
      if (memberSnap.exists && existing != null) {
        // Already a member (e.g. retried request) — nothing to write.
        return MemberDto.fromJson({...existing, 'userId': memberSnap.id});
      }

      if (roomSnap.exists) {
        tx.update(roomRef, {'memberCount': FieldValue.increment(1)});
      } else {
        tx.set(roomRef, {
          'code': code,
          'memberCount': 1,
          'createdAt': FieldValue.serverTimestamp(),
          'lastMessageAt': null,
        });
      }

      tx.set(memberRef, {
        'userId': userId,
        'alias': alias,
        'handle': handle,
        'joinedAt': FieldValue.serverTimestamp(),
      });

      return MemberDto(
        userId: userId,
        alias: alias,
        handle: handle,
        joinedAt: DateTime.now(),
      );
    });
  }
}
