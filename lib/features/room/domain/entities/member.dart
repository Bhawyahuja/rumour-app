import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';

@freezed
abstract class Member with _$Member {
  const Member._();

  const factory Member({
    required String userId,
    required String roomCode,
    required String alias,
    DateTime? joinedAt,
  }) = _Member;

  String get handle => alias.replaceAll(' ', '');
}
