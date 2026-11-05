

import 'package:rumour/core/utils/result.dart';
import 'package:rumour/features/chat/domain/entities/message.dart';
import 'package:rumour/features/chat/domain/entities/message_window.dart';

abstract interface class ChatRepository {
  /// Live window of the newest messages (newest first).
  Stream<Result<MessageWindow>> watchLatestMessages(String roomCode);

  /// One page of history older than [before] (newest first).
  Future<Result<List<Message>>> fetchOlderMessages(
    String roomCode, {
    required DateTime before,
  });

  Future<Result<void>> sendMessage({
    required String roomCode,
    required String senderAlias,
    required String text,
  });

  /// Page size used by both methods above.
  int get pageSize;
}
