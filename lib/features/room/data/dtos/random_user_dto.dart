import 'package:freezed_annotation/freezed_annotation.dart';

part 'random_user_dto.freezed.dart';
part 'random_user_dto.g.dart';

/// `GET https://randomuser.me/api/` response. Only the fields the app uses
/// are modelled (we request just those with `inc=`).
@freezed
abstract class RandomUserResponseDto with _$RandomUserResponseDto {
  const factory RandomUserResponseDto({
    @Default(<RandomUserDto>[]) List<RandomUserDto> results,
  }) = _RandomUserResponseDto;

  factory RandomUserResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RandomUserResponseDtoFromJson(json);
}

@freezed
abstract class RandomUserDto with _$RandomUserDto {
  const factory RandomUserDto({
    required RandomUserNameDto name,
    RandomUserLoginDto? login,
  }) = _RandomUserDto;

  factory RandomUserDto.fromJson(Map<String, dynamic> json) =>
      _$RandomUserDtoFromJson(json);
}

/// `{"title": "Ms", "first": "Montserrat", "last": "Romero"}`
@freezed
abstract class RandomUserNameDto with _$RandomUserNameDto {
  const factory RandomUserNameDto({
    @Default('') String title,
    required String first,
    required String last,
  }) = _RandomUserNameDto;

  factory RandomUserNameDto.fromJson(Map<String, dynamic> json) =>
      _$RandomUserNameDtoFromJson(json);
}

/// `{"uuid": "bcfc…", "username": "redbutterfly310"}`
@freezed
abstract class RandomUserLoginDto with _$RandomUserLoginDto {
  const factory RandomUserLoginDto({
    String? uuid,
    String? username,
  }) = _RandomUserLoginDto;

  factory RandomUserLoginDto.fromJson(Map<String, dynamic> json) =>
      _$RandomUserLoginDtoFromJson(json);
}
