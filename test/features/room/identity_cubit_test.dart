import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rumour/core/error/failures.dart';
import 'package:rumour/core/utils/result.dart';
import 'package:rumour/features/room/domain/entities/alias.dart';
import 'package:rumour/features/room/domain/entities/member.dart';
import 'package:rumour/features/room/presentation/identity/cubit/identity_cubit.dart';

import '../../helpers/mocks.dart';

void main() {
  late MockAliasRepository aliases;
  late MockRoomRepository rooms;

  const alias = Alias(firstName: 'Brave', lastName: 'Badger');
  const member = Member(userId: 'u1', roomCode: '581200', alias: 'Brave Badger');

  setUp(() {
    aliases = MockAliasRepository();
    rooms = MockRoomRepository();
  });

  IdentityCubit build() =>
      IdentityCubit(roomCode: '581200', aliases: aliases, rooms: rooms);

  blocTest<IdentityCubit, IdentityState>(
    'generate → ready',
    setUp: () => when(() => aliases.generateAlias(roomCode: '581200'))
        .thenAnswer((_) async => const Ok(alias)),
    build: build,
    act: (c) => c.generate(),
    expect: () => const [
      IdentityState.generating(),
      IdentityState.ready(alias: alias),
    ],
  );

  blocTest<IdentityCubit, IdentityState>(
    'generate failure → failure without alias',
    setUp: () => when(() => aliases.generateAlias(roomCode: '581200'))
        .thenAnswer((_) async => const Err(Failure.network())),
    build: build,
    act: (c) => c.generate(),
    expect: () => const [
      IdentityState.generating(),
      IdentityState.failure(failure: Failure.network()),
    ],
  );

  blocTest<IdentityCubit, IdentityState>(
    'acknowledge persists membership with display name and handle',
    setUp: () => when(
      () => rooms.joinRoom(
        code: '581200',
        alias: 'Brave Badger',
        handle: 'BraveBadger',
      ),
    ).thenAnswer((_) async => const Ok(member)),
    build: build,
    seed: () => const IdentityState.ready(alias: alias),
    act: (c) => c.acknowledge(),
    expect: () => const [
      IdentityState.joining(alias: alias),
      IdentityState.joined(member: member),
    ],
  );

  blocTest<IdentityCubit, IdentityState>(
    'join failure keeps the alias so the user can retry',
    setUp: () => when(
      () => rooms.joinRoom(
        code: any(named: 'code'),
        alias: any(named: 'alias'),
        handle: any(named: 'handle'),
      ),
    ).thenAnswer((_) async => const Err(Failure.server())),
    build: build,
    seed: () => const IdentityState.ready(alias: alias),
    act: (c) => c.acknowledge(),
    expect: () => const [
      IdentityState.joining(alias: alias),
      IdentityState.failure(failure: Failure.server(), alias: alias),
    ],
  );

  test('state exposes the primary action', () {
    expect(const IdentityState.generating().action, IdentityAction.none);
    expect(const IdentityState.ready(alias: alias).action,
        IdentityAction.acknowledge);
    const network = Failure.network();
    expect(
      const IdentityState.failure(failure: network).action,
      IdentityAction.retry,
    );
    expect(
      const IdentityState.failure(failure: network, alias: alias).joinError,
      network,
    );
    expect(
      const IdentityState.failure(failure: network).generationError,
      network,
    );
  });
}
