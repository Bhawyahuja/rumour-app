import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
abstract class Message with _$Message {
  const Message._();

  const factory Message({
    required String id,
    required String text,
    required String senderId,
    required String senderAlias,
    required DateTime createdAt,

    /// Sent by the current device user.
    @Default(false) bool isMine,

    /// Written locally but not yet acknowledged by the server.
    @Default(false) bool isPending,
  }) = _Message;

  String get senderHandle => senderAlias.replaceAll(' ', '');
}
