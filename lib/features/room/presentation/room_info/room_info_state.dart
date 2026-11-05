part of 'room_info_cubit.dart';

@freezed
abstract class RoomInfoState with _$RoomInfoState {
  const factory RoomInfoState({
    required Room room,

    /// `false` until the first snapshot arrives — drives the header shimmer.
    @Default(false) bool isLoaded,
  }) = _RoomInfoState;
}
