// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'random_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RandomUserResponseDto {

 List<RandomUserDto> get results;
/// Create a copy of RandomUserResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RandomUserResponseDtoCopyWith<RandomUserResponseDto> get copyWith => _$RandomUserResponseDtoCopyWithImpl<RandomUserResponseDto>(this as RandomUserResponseDto, _$identity);

  /// Serializes this RandomUserResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RandomUserResponseDto&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'RandomUserResponseDto(results: $results)';
}


}

/// @nodoc
abstract mixin class $RandomUserResponseDtoCopyWith<$Res>  {
  factory $RandomUserResponseDtoCopyWith(RandomUserResponseDto value, $Res Function(RandomUserResponseDto) _then) = _$RandomUserResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<RandomUserDto> results
});




}
/// @nodoc
class _$RandomUserResponseDtoCopyWithImpl<$Res>
    implements $RandomUserResponseDtoCopyWith<$Res> {
  _$RandomUserResponseDtoCopyWithImpl(this._self, this._then);

  final RandomUserResponseDto _self;
  final $Res Function(RandomUserResponseDto) _then;

/// Create a copy of RandomUserResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<RandomUserDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [RandomUserResponseDto].
extension RandomUserResponseDtoPatterns on RandomUserResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RandomUserResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RandomUserResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RandomUserResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _RandomUserResponseDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RandomUserResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _RandomUserResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RandomUserDto> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RandomUserResponseDto() when $default != null:
return $default(_that.results);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RandomUserDto> results)  $default,) {final _that = this;
switch (_that) {
case _RandomUserResponseDto():
return $default(_that.results);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RandomUserDto> results)?  $default,) {final _that = this;
switch (_that) {
case _RandomUserResponseDto() when $default != null:
return $default(_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RandomUserResponseDto implements RandomUserResponseDto {
  const _RandomUserResponseDto({final  List<RandomUserDto> results = const <RandomUserDto>[]}): _results = results;
  factory _RandomUserResponseDto.fromJson(Map<String, dynamic> json) => _$RandomUserResponseDtoFromJson(json);

 final  List<RandomUserDto> _results;
@override@JsonKey() List<RandomUserDto> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of RandomUserResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RandomUserResponseDtoCopyWith<_RandomUserResponseDto> get copyWith => __$RandomUserResponseDtoCopyWithImpl<_RandomUserResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RandomUserResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RandomUserResponseDto&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'RandomUserResponseDto(results: $results)';
}


}

/// @nodoc
abstract mixin class _$RandomUserResponseDtoCopyWith<$Res> implements $RandomUserResponseDtoCopyWith<$Res> {
  factory _$RandomUserResponseDtoCopyWith(_RandomUserResponseDto value, $Res Function(_RandomUserResponseDto) _then) = __$RandomUserResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<RandomUserDto> results
});




}
/// @nodoc
class __$RandomUserResponseDtoCopyWithImpl<$Res>
    implements _$RandomUserResponseDtoCopyWith<$Res> {
  __$RandomUserResponseDtoCopyWithImpl(this._self, this._then);

  final _RandomUserResponseDto _self;
  final $Res Function(_RandomUserResponseDto) _then;

/// Create a copy of RandomUserResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(_RandomUserResponseDto(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<RandomUserDto>,
  ));
}


}


/// @nodoc
mixin _$RandomUserDto {

 RandomUserNameDto get name; RandomUserLoginDto? get login;
/// Create a copy of RandomUserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RandomUserDtoCopyWith<RandomUserDto> get copyWith => _$RandomUserDtoCopyWithImpl<RandomUserDto>(this as RandomUserDto, _$identity);

  /// Serializes this RandomUserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RandomUserDto&&(identical(other.name, name) || other.name == name)&&(identical(other.login, login) || other.login == login));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,login);

@override
String toString() {
  return 'RandomUserDto(name: $name, login: $login)';
}


}

/// @nodoc
abstract mixin class $RandomUserDtoCopyWith<$Res>  {
  factory $RandomUserDtoCopyWith(RandomUserDto value, $Res Function(RandomUserDto) _then) = _$RandomUserDtoCopyWithImpl;
@useResult
$Res call({
 RandomUserNameDto name, RandomUserLoginDto? login
});


$RandomUserNameDtoCopyWith<$Res> get name;$RandomUserLoginDtoCopyWith<$Res>? get login;

}
/// @nodoc
class _$RandomUserDtoCopyWithImpl<$Res>
    implements $RandomUserDtoCopyWith<$Res> {
  _$RandomUserDtoCopyWithImpl(this._self, this._then);

  final RandomUserDto _self;
  final $Res Function(RandomUserDto) _then;

/// Create a copy of RandomUserDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? login = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as RandomUserNameDto,login: freezed == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as RandomUserLoginDto?,
  ));
}
/// Create a copy of RandomUserDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RandomUserNameDtoCopyWith<$Res> get name {
  
  return $RandomUserNameDtoCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of RandomUserDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RandomUserLoginDtoCopyWith<$Res>? get login {
    if (_self.login == null) {
    return null;
  }

  return $RandomUserLoginDtoCopyWith<$Res>(_self.login!, (value) {
    return _then(_self.copyWith(login: value));
  });
}
}


/// Adds pattern-matching-related methods to [RandomUserDto].
extension RandomUserDtoPatterns on RandomUserDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RandomUserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RandomUserDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RandomUserDto value)  $default,){
final _that = this;
switch (_that) {
case _RandomUserDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RandomUserDto value)?  $default,){
final _that = this;
switch (_that) {
case _RandomUserDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RandomUserNameDto name,  RandomUserLoginDto? login)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RandomUserDto() when $default != null:
return $default(_that.name,_that.login);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RandomUserNameDto name,  RandomUserLoginDto? login)  $default,) {final _that = this;
switch (_that) {
case _RandomUserDto():
return $default(_that.name,_that.login);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RandomUserNameDto name,  RandomUserLoginDto? login)?  $default,) {final _that = this;
switch (_that) {
case _RandomUserDto() when $default != null:
return $default(_that.name,_that.login);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RandomUserDto implements RandomUserDto {
  const _RandomUserDto({required this.name, this.login});
  factory _RandomUserDto.fromJson(Map<String, dynamic> json) => _$RandomUserDtoFromJson(json);

@override final  RandomUserNameDto name;
@override final  RandomUserLoginDto? login;

/// Create a copy of RandomUserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RandomUserDtoCopyWith<_RandomUserDto> get copyWith => __$RandomUserDtoCopyWithImpl<_RandomUserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RandomUserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RandomUserDto&&(identical(other.name, name) || other.name == name)&&(identical(other.login, login) || other.login == login));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,login);

@override
String toString() {
  return 'RandomUserDto(name: $name, login: $login)';
}


}

/// @nodoc
abstract mixin class _$RandomUserDtoCopyWith<$Res> implements $RandomUserDtoCopyWith<$Res> {
  factory _$RandomUserDtoCopyWith(_RandomUserDto value, $Res Function(_RandomUserDto) _then) = __$RandomUserDtoCopyWithImpl;
@override @useResult
$Res call({
 RandomUserNameDto name, RandomUserLoginDto? login
});


@override $RandomUserNameDtoCopyWith<$Res> get name;@override $RandomUserLoginDtoCopyWith<$Res>? get login;

}
/// @nodoc
class __$RandomUserDtoCopyWithImpl<$Res>
    implements _$RandomUserDtoCopyWith<$Res> {
  __$RandomUserDtoCopyWithImpl(this._self, this._then);

  final _RandomUserDto _self;
  final $Res Function(_RandomUserDto) _then;

/// Create a copy of RandomUserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? login = freezed,}) {
  return _then(_RandomUserDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as RandomUserNameDto,login: freezed == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as RandomUserLoginDto?,
  ));
}

/// Create a copy of RandomUserDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RandomUserNameDtoCopyWith<$Res> get name {
  
  return $RandomUserNameDtoCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of RandomUserDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RandomUserLoginDtoCopyWith<$Res>? get login {
    if (_self.login == null) {
    return null;
  }

  return $RandomUserLoginDtoCopyWith<$Res>(_self.login!, (value) {
    return _then(_self.copyWith(login: value));
  });
}
}


/// @nodoc
mixin _$RandomUserNameDto {

 String get title; String get first; String get last;
/// Create a copy of RandomUserNameDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RandomUserNameDtoCopyWith<RandomUserNameDto> get copyWith => _$RandomUserNameDtoCopyWithImpl<RandomUserNameDto>(this as RandomUserNameDto, _$identity);

  /// Serializes this RandomUserNameDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RandomUserNameDto&&(identical(other.title, title) || other.title == title)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,first,last);

@override
String toString() {
  return 'RandomUserNameDto(title: $title, first: $first, last: $last)';
}


}

/// @nodoc
abstract mixin class $RandomUserNameDtoCopyWith<$Res>  {
  factory $RandomUserNameDtoCopyWith(RandomUserNameDto value, $Res Function(RandomUserNameDto) _then) = _$RandomUserNameDtoCopyWithImpl;
@useResult
$Res call({
 String title, String first, String last
});




}
/// @nodoc
class _$RandomUserNameDtoCopyWithImpl<$Res>
    implements $RandomUserNameDtoCopyWith<$Res> {
  _$RandomUserNameDtoCopyWithImpl(this._self, this._then);

  final RandomUserNameDto _self;
  final $Res Function(RandomUserNameDto) _then;

/// Create a copy of RandomUserNameDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? first = null,Object? last = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RandomUserNameDto].
extension RandomUserNameDtoPatterns on RandomUserNameDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RandomUserNameDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RandomUserNameDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RandomUserNameDto value)  $default,){
final _that = this;
switch (_that) {
case _RandomUserNameDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RandomUserNameDto value)?  $default,){
final _that = this;
switch (_that) {
case _RandomUserNameDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String first,  String last)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RandomUserNameDto() when $default != null:
return $default(_that.title,_that.first,_that.last);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String first,  String last)  $default,) {final _that = this;
switch (_that) {
case _RandomUserNameDto():
return $default(_that.title,_that.first,_that.last);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String first,  String last)?  $default,) {final _that = this;
switch (_that) {
case _RandomUserNameDto() when $default != null:
return $default(_that.title,_that.first,_that.last);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RandomUserNameDto implements RandomUserNameDto {
  const _RandomUserNameDto({this.title = '', required this.first, required this.last});
  factory _RandomUserNameDto.fromJson(Map<String, dynamic> json) => _$RandomUserNameDtoFromJson(json);

@override@JsonKey() final  String title;
@override final  String first;
@override final  String last;

/// Create a copy of RandomUserNameDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RandomUserNameDtoCopyWith<_RandomUserNameDto> get copyWith => __$RandomUserNameDtoCopyWithImpl<_RandomUserNameDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RandomUserNameDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RandomUserNameDto&&(identical(other.title, title) || other.title == title)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,first,last);

@override
String toString() {
  return 'RandomUserNameDto(title: $title, first: $first, last: $last)';
}


}

/// @nodoc
abstract mixin class _$RandomUserNameDtoCopyWith<$Res> implements $RandomUserNameDtoCopyWith<$Res> {
  factory _$RandomUserNameDtoCopyWith(_RandomUserNameDto value, $Res Function(_RandomUserNameDto) _then) = __$RandomUserNameDtoCopyWithImpl;
@override @useResult
$Res call({
 String title, String first, String last
});




}
/// @nodoc
class __$RandomUserNameDtoCopyWithImpl<$Res>
    implements _$RandomUserNameDtoCopyWith<$Res> {
  __$RandomUserNameDtoCopyWithImpl(this._self, this._then);

  final _RandomUserNameDto _self;
  final $Res Function(_RandomUserNameDto) _then;

/// Create a copy of RandomUserNameDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? first = null,Object? last = null,}) {
  return _then(_RandomUserNameDto(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RandomUserLoginDto {

 String? get uuid; String? get username;
/// Create a copy of RandomUserLoginDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RandomUserLoginDtoCopyWith<RandomUserLoginDto> get copyWith => _$RandomUserLoginDtoCopyWithImpl<RandomUserLoginDto>(this as RandomUserLoginDto, _$identity);

  /// Serializes this RandomUserLoginDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RandomUserLoginDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,username);

@override
String toString() {
  return 'RandomUserLoginDto(uuid: $uuid, username: $username)';
}


}

/// @nodoc
abstract mixin class $RandomUserLoginDtoCopyWith<$Res>  {
  factory $RandomUserLoginDtoCopyWith(RandomUserLoginDto value, $Res Function(RandomUserLoginDto) _then) = _$RandomUserLoginDtoCopyWithImpl;
@useResult
$Res call({
 String? uuid, String? username
});




}
/// @nodoc
class _$RandomUserLoginDtoCopyWithImpl<$Res>
    implements $RandomUserLoginDtoCopyWith<$Res> {
  _$RandomUserLoginDtoCopyWithImpl(this._self, this._then);

  final RandomUserLoginDto _self;
  final $Res Function(RandomUserLoginDto) _then;

/// Create a copy of RandomUserLoginDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = freezed,Object? username = freezed,}) {
  return _then(_self.copyWith(
uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RandomUserLoginDto].
extension RandomUserLoginDtoPatterns on RandomUserLoginDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RandomUserLoginDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RandomUserLoginDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RandomUserLoginDto value)  $default,){
final _that = this;
switch (_that) {
case _RandomUserLoginDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RandomUserLoginDto value)?  $default,){
final _that = this;
switch (_that) {
case _RandomUserLoginDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? uuid,  String? username)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RandomUserLoginDto() when $default != null:
return $default(_that.uuid,_that.username);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? uuid,  String? username)  $default,) {final _that = this;
switch (_that) {
case _RandomUserLoginDto():
return $default(_that.uuid,_that.username);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? uuid,  String? username)?  $default,) {final _that = this;
switch (_that) {
case _RandomUserLoginDto() when $default != null:
return $default(_that.uuid,_that.username);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RandomUserLoginDto implements RandomUserLoginDto {
  const _RandomUserLoginDto({this.uuid, this.username});
  factory _RandomUserLoginDto.fromJson(Map<String, dynamic> json) => _$RandomUserLoginDtoFromJson(json);

@override final  String? uuid;
@override final  String? username;

/// Create a copy of RandomUserLoginDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RandomUserLoginDtoCopyWith<_RandomUserLoginDto> get copyWith => __$RandomUserLoginDtoCopyWithImpl<_RandomUserLoginDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RandomUserLoginDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RandomUserLoginDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,username);

@override
String toString() {
  return 'RandomUserLoginDto(uuid: $uuid, username: $username)';
}


}

/// @nodoc
abstract mixin class _$RandomUserLoginDtoCopyWith<$Res> implements $RandomUserLoginDtoCopyWith<$Res> {
  factory _$RandomUserLoginDtoCopyWith(_RandomUserLoginDto value, $Res Function(_RandomUserLoginDto) _then) = __$RandomUserLoginDtoCopyWithImpl;
@override @useResult
$Res call({
 String? uuid, String? username
});




}
/// @nodoc
class __$RandomUserLoginDtoCopyWithImpl<$Res>
    implements _$RandomUserLoginDtoCopyWith<$Res> {
  __$RandomUserLoginDtoCopyWithImpl(this._self, this._then);

  final _RandomUserLoginDto _self;
  final $Res Function(_RandomUserLoginDto) _then;

/// Create a copy of RandomUserLoginDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = freezed,Object? username = freezed,}) {
  return _then(_RandomUserLoginDto(
uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
