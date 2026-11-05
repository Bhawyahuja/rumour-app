// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RandomUserResponseDto _$RandomUserResponseDtoFromJson(
  Map<String, dynamic> json,
) => _RandomUserResponseDto(
  results:
      (json['results'] as List<dynamic>?)
          ?.map((e) => RandomUserDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <RandomUserDto>[],
);

Map<String, dynamic> _$RandomUserResponseDtoToJson(
  _RandomUserResponseDto instance,
) => <String, dynamic>{'results': instance.results};

_RandomUserDto _$RandomUserDtoFromJson(Map<String, dynamic> json) =>
    _RandomUserDto(
      name: RandomUserNameDto.fromJson(json['name'] as Map<String, dynamic>),
      login: json['login'] == null
          ? null
          : RandomUserLoginDto.fromJson(json['login'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RandomUserDtoToJson(_RandomUserDto instance) =>
    <String, dynamic>{'name': instance.name, 'login': instance.login};

_RandomUserNameDto _$RandomUserNameDtoFromJson(Map<String, dynamic> json) =>
    _RandomUserNameDto(
      title: json['title'] as String? ?? '',
      first: json['first'] as String,
      last: json['last'] as String,
    );

Map<String, dynamic> _$RandomUserNameDtoToJson(_RandomUserNameDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'first': instance.first,
      'last': instance.last,
    };

_RandomUserLoginDto _$RandomUserLoginDtoFromJson(Map<String, dynamic> json) =>
    _RandomUserLoginDto(
      uuid: json['uuid'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$RandomUserLoginDtoToJson(_RandomUserLoginDto instance) =>
    <String, dynamic>{'uuid': instance.uuid, 'username': instance.username};
