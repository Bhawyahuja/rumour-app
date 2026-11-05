import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rumour/core/error/exceptions.dart';
import 'package:rumour/core/error/failures.dart';
import 'package:rumour/features/room/data/dtos/random_user_dto.dart';
import 'package:rumour/features/room/data/repositories/alias_repository_impl.dart';
import 'package:rumour/features/room/domain/entities/alias.dart';

import '../../helpers/mocks.dart';

void main() {
  late MockRandomUserRemoteDataSource remote;
  late MockRoomRemoteDataSource rooms;
  late AliasRepositoryImpl repo;

  RandomUserDto user(String first, String last) => RandomUserDto(
        name: RandomUserNameDto(title: 'Ms', first: first, last: last),
      );

  setUp(() {
    remote = MockRandomUserRemoteDataSource();
    rooms = MockRoomRemoteDataSource();
    repo = AliasRepositoryImpl(remote: remote, rooms: rooms);
    when(
      () => rooms.isAliasTaken(
        code: any(named: 'code'),
        alias: any(named: 'alias'),
      ),
    ).thenAnswer((_) async => false);
  });

  test('parses the randomuser.me response shape', () {
    final dto = RandomUserResponseDto.fromJson(const {
      'results': [
        {
          'gender': 'female',
          'name': {'title': 'Ms', 'first': 'Montserrat', 'last': 'Romero'},
          'login': {'uuid': 'bcfc', 'username': 'redbutterfly310'},
          'picture': {
            'large': 'https://randomuser.me/api/portraits/women/39.jpg',
            'medium': 'https://randomuser.me/api/portraits/med/women/39.jpg',
            'thumbnail': 'https://randomuser.me/api/portraits/thumb/women/39.jpg',
          },
          'nat': 'ES',
        },
      ],
      'info': {'seed': 'f7b2413d10d85fc3', 'results': 1},
    });

    final alias = AliasRepositoryImpl.toAlias(dto.results.single);
    expect(alias.displayName, 'Montserrat Romero');
    expect(alias.handle, 'MontserratRomero');
  });

  test('maps the API user to an alias', () async {
    when(() => remote.fetchRandomUser())
        .thenAnswer((_) async => user('Montserrat', 'Romero'));

    final result = await repo.generateAlias(roomCode: '123456');

    expect(
      result.valueOrNull,
      const Alias(firstName: 'Montserrat', lastName: 'Romero'),
    );
  });

  test('fetches another user when the name is taken in the room', () async {
    final users = [user('Ana', 'Lopez'), user('Montserrat', 'Romero')];
    when(() => remote.fetchRandomUser())
        .thenAnswer((_) async => users.removeAt(0));
    when(() => rooms.isAliasTaken(code: '123456', alias: 'Ana Lopez'))
        .thenAnswer((_) async => true);

    final result = await repo.generateAlias(roomCode: '123456');

    expect(result.valueOrNull?.displayName, 'Montserrat Romero');
    verify(() => remote.fetchRandomUser()).called(2);
  });

  test('API failure → typed network failure (no silent fallback)', () async {
    when(() => remote.fetchRandomUser()).thenThrow(const NetworkException());

    final result = await repo.generateAlias(roomCode: '123456');

    expect(result.failureOrNull, isA<NetworkFailure>());
  });

  test('blank names from the API are rejected', () {
    expect(
      () => AliasRepositoryImpl.toAlias(user('  ', 'Romero')),
      throwsA(isA<ParsingException>()),
    );
  });
}
