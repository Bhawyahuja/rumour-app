import 'package:freezed_annotation/freezed_annotation.dart';

import 'message.dart';

part 'message_window.freezed.dart';

/// The live "latest messages" window of a room.
@freezed
abstract class MessageWindow with _$MessageWindow {
  const factory MessageWindow({
    /// Newest first.
    required List<Message> messages,

    /// `true` when served from the on-device cache (offline / not synced yet).
    @Default(false) bool isFromCache,
  }) = _MessageWindow;
}
