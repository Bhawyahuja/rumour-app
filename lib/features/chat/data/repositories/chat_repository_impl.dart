import 'dart:async';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/error_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/result.dart';
import '../../../user/domain/repositories/user_repository.dart';
import '../../domain/entities/message.dart';
import '../../domain/entities/message_window.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';

class ChatRepositoryImpl implements ChatRepository {
  const ChatRepositoryImpl(this._remote, this._users);

  final ChatRemoteDataSource _remote;
  final UserRepository _users;

  @override
  int get pageSize => AppConstants.messagesPageSize;

  List<Message> _toEntities(List<MessageSnapshot> items) {
    final me = _users.currentUserId;
    return items
        .map((s) => s.dto.toEntity(currentUserId: me, isPending: s.isPending))
        .toList(growable: false);
  }

  @override
  Stream<Result<MessageWindow>> watchLatestMessages(String roomCode) {
    return _remote
        .watchLatest(roomCode, limit: pageSize)
        .map<Result<MessageWindow>>(
          (snap) => Ok(
            MessageWindow(
              messages: _toEntities(snap.items),
              isFromCache: snap.fromCache,
            ),
          ),
        )
        .transform(
          StreamTransformer<Result<MessageWindow>,
              Result<MessageWindow>>.fromHandlers(
            handleError: (error, _, sink) =>
                sink.add(Err(ErrorMapper.toFailure(error))),
          ),
        );
  }

  @override
  Future<Result<List<Message>>> fetchOlderMessages(
    String roomCode, {
    required DateTime before,
  }) async {
    try {
      final items = await _remote.fetchBefore(
        roomCode,
        before: before,
        limit: pageSize,
      );
      return Ok(_toEntities(items));
    } catch (e) {
      return Err(ErrorMapper.toFailure(e));
    }
  }

  @override
  Future<Result<void>> sendMessage({
    required String roomCode,
    required String senderAlias,
    required String text,
  }) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) {
      return const Err(
        Failure.validation(reason: ValidationReason.emptyMessage),
      );
    }
    if (trimmed.length > AppConstants.maxMessageLength) {
      return const Err(
        Failure.validation(reason: ValidationReason.messageTooLong),
      );
    }
    try {
      await _remote.send(
        roomCode,
        senderId: _users.currentUserId,
        senderAlias: senderAlias,
        text: trimmed,
      );
      return const Ok(null);
    } catch (e) {
      return Err(ErrorMapper.toFailure(e));
    }
  }
}
