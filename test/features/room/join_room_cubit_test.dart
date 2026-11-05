import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rumour/core/error/failures.dart';
import 'package:rumour/core/utils/result.dart';
import 'package:rumour/features/room/domain/entities/member.dart';
import 'package:rumour/features/room/presentation/join/cubit/join_room_cubit.dart';

import '../../helpers/mocks.dart';

void main() {
  late MockRoomRepository rooms;

  const member = Member(userId: 'u1', roomCode: '123456', alias: 'Brave Badger');

  setUp(() => rooms = MockRoomRepository());

  blocTest<JoinRoomCubit, JoinRoomState>(
    'emits failure for an incomplete code without hitting the repository',
    build: () => JoinRoomCubit(rooms),
    act: (c) => c.submit('12'),
    expect: () => [
      const JoinRoomState.failure(
        failure: Failure.validation(reason: ValidationReason.invalidRoomCode),
        attempt: 1,
      ),
    ],
    verify: (_) => verifyNever(() => rooms.findMembership(any())),
  );

  blocTest<JoinRoomCubit, JoinRoomState>(
    'first visit → needsIdentity',
    setUp: () => when(() => rooms.findMembership('123456'))
        .thenAnswer((_) async => const Ok<Member?>(null)),
    build: () => JoinRoomCubit(rooms),
    act: (c) => c.submit('123456'),
    expect: () => const [
      JoinRoomState.checking(code: '123456'),
      JoinRoomState.needsIdentity(code: '123456'),
    ],
  );

  blocTest<JoinRoomCubit, JoinRoomState>(
    'returning member → alreadyMember',
    setUp: () => when(() => rooms.findMembership('123456'))
        .thenAnswer((_) async => const Ok<Member?>(member)),
    build: () => JoinRoomCubit(rooms),
    act: (c) => c.submit('123456'),
    expect: () => const [
      JoinRoomState.checking(code: '123456'),
      JoinRoomState.alreadyMember(member: member),
    ],
  );

  blocTest<JoinRoomCubit, JoinRoomState>(
    'repository error → failure with message',
    setUp: () => when(() => rooms.findMembership('123456')).thenAnswer(
      (_) async => const Err<Member?>(Failure.network()),
    ),
    build: () => JoinRoomCubit(rooms),
    act: (c) => c.submit('123456'),
    expect: () => const [
      JoinRoomState.checking(code: '123456'),
      JoinRoomState.failure(failure: Failure.network(), attempt: 1),
    ],
  );

  blocTest<JoinRoomCubit, JoinRoomState>(
    'codeChanged auto-submits on the 6th digit',
    setUp: () => when(() => rooms.findMembership('123456'))
        .thenAnswer((_) async => const Ok<Member?>(null)),
    build: () => JoinRoomCubit(rooms),
    act: (c) async {
      await c.codeChanged('12345');
      await c.codeChanged('123456');
    },
    expect: () => const [
      JoinRoomState.checking(code: '123456'),
      JoinRoomState.needsIdentity(code: '123456'),
    ],
  );

  blocTest<JoinRoomCubit, JoinRoomState>(
    'editing after a failure clears the error',
    build: () => JoinRoomCubit(rooms),
    seed: () => const JoinRoomState.failure(
      failure: Failure.network(),
      attempt: 1,
    ),
    act: (c) => c.codeChanged('12'),
    expect: () => const [JoinRoomState.idle()],
  );

  test('state helpers', () {
    const failure = JoinRoomState.failure(
      failure: Failure.server(),
      attempt: 3,
    );
    expect(failure.error, const Failure.server());
    expect(failure.errorTick, 3);
    expect(const JoinRoomState.checking(code: '1').canEdit, isFalse);
    expect(const JoinRoomState.needsIdentity(code: '1').isNavigation, isTrue);
  });
}
