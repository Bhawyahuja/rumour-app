import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rumour/core/network/dio_client.dart';
import 'package:rumour/core/services/app_lifecycle_service.dart';
import 'package:rumour/core/services/clipboard_service.dart';
import 'package:rumour/core/services/notification_service.dart';
import 'package:rumour/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:rumour/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:rumour/features/chat/domain/repositories/chat_repository.dart';
import 'package:rumour/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:rumour/features/room/data/datasources/random_user_remote_data_source.dart';
import 'package:rumour/features/room/data/datasources/room_remote_data_source.dart';
import 'package:rumour/features/room/data/repositories/alias_repository_impl.dart';
import 'package:rumour/features/room/data/repositories/room_repository_impl.dart';
import 'package:rumour/features/room/domain/entities/member.dart';
import 'package:rumour/features/room/domain/repositories/alias_repository.dart';
import 'package:rumour/features/room/domain/repositories/room_repository.dart';
import 'package:rumour/features/room/presentation/identity/cubit/identity_cubit.dart';
import 'package:rumour/features/room/presentation/join/cubit/join_room_cubit.dart';
import 'package:rumour/features/room/presentation/room_info/room_info_cubit.dart';
import 'package:rumour/features/theme/data/datasources/theme_local_data_source.dart';
import 'package:rumour/features/theme/data/repositories/theme_repository_impl.dart';
import 'package:rumour/features/theme/domain/repositories/theme_repository.dart';
import 'package:rumour/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:rumour/features/user/data/datasources/user_local_data_source.dart';
import 'package:rumour/features/user/data/repositories/user_repository_impl.dart';
import 'package:rumour/features/user/domain/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

/// Registers every dependency. Call once from `main` after Firebase init.
Future<void> configureDependencies() async {
  // ── External ────────────────────────────────────────────────────────────
  final prefs = await SharedPreferences.getInstance();
  getIt
    ..registerSingleton<SharedPreferences>(prefs)
    ..registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance)
    ..registerLazySingleton<Dio>(DioClient.create);

  // ── Services ────────────────────────────────────────────────────────────
  final notifications = LocalNotificationService();
  await notifications.init();
  getIt
    ..registerSingleton<NotificationService>(notifications)
    ..registerLazySingleton<ClipboardService>(SystemClipboardService.new)
    ..registerSingleton<AppLifecycleService>(
      AppLifecycleServiceImpl(),
      dispose: (s) => s.dispose(),
    );

  // ── Data sources ────────────────────────────────────────────────────────
  getIt
    ..registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<ThemeLocalDataSource>(
      () => ThemeLocalDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<RoomRemoteDataSource>(
      () => RoomRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<RandomUserRemoteDataSource>(
      () => RandomUserRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceImpl(getIt()),
    );

  // ── Repositories ────────────────────────────────────────────────────────
  getIt
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(getIt()))
    ..registerLazySingleton<ThemeRepository>(() => ThemeRepositoryImpl(getIt()))
    ..registerLazySingleton<RoomRepository>(
      () => RoomRepositoryImpl(getIt(), getIt()),
    )
    ..registerLazySingleton<AliasRepository>(
      () => AliasRepositoryImpl(remote: getIt(), rooms: getIt()),
    )
    ..registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(getIt(), getIt()),
    );

  // The anonymous device identity must exist before any room operation.
  await getIt<UserRepository>().ensureUserId();

  // ── Presentation ────────────────────────────────────────────────────────
  getIt
    ..registerLazySingleton<ThemeCubit>(() => ThemeCubit(getIt()))
    ..registerFactory<JoinRoomCubit>(() => JoinRoomCubit(getIt()))
    ..registerFactoryParam<IdentityCubit, String, void>(
      (roomCode, _) =>
          IdentityCubit(roomCode: roomCode, aliases: getIt(), rooms: getIt()),
    )
    ..registerFactoryParam<RoomInfoCubit, String, void>(
      (roomCode, _) => RoomInfoCubit(roomCode: roomCode, rooms: getIt()),
    )
    ..registerFactoryParam<ChatCubit, Member, void>(
      (member, _) => ChatCubit(
        member: member,
        chat: getIt(),
        notifications: getIt(),
        lifecycle: getIt(),
        clipboard: getIt(),
      ),
    );
}
