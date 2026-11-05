import 'package:mocktail/mocktail.dart';
import 'package:rumour/core/services/app_lifecycle_service.dart';
import 'package:rumour/core/services/clipboard_service.dart';
import 'package:rumour/core/services/notification_service.dart';
import 'package:rumour/features/chat/domain/repositories/chat_repository.dart';
import 'package:rumour/features/room/data/datasources/random_user_remote_data_source.dart';
import 'package:rumour/features/room/data/datasources/room_remote_data_source.dart';
import 'package:rumour/features/room/domain/repositories/alias_repository.dart';
import 'package:rumour/features/room/domain/repositories/room_repository.dart';

class MockRoomRepository extends Mock implements RoomRepository {}

class MockAliasRepository extends Mock implements AliasRepository {}

class MockChatRepository extends Mock implements ChatRepository {}

class MockRoomRemoteDataSource extends Mock implements RoomRemoteDataSource {}

class MockRandomUserRemoteDataSource extends Mock
    implements RandomUserRemoteDataSource {}

class MockNotificationService extends Mock implements NotificationService {}

class MockAppLifecycleService extends Mock implements AppLifecycleService {}

class MockClipboardService extends Mock implements ClipboardService {}
