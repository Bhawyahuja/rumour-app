// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {

 String? get debugMessage;
/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.debugMessage, debugMessage) || other.debugMessage == debugMessage));
}


@override
int get hashCode => Object.hash(runtimeType,debugMessage);

@override
String toString() {
  return 'Failure(debugMessage: $debugMessage)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res>  {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String? debugMessage
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? debugMessage = freezed,}) {
  return _then(_self.copyWith(
debugMessage: freezed == debugMessage ? _self.debugMessage : debugMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NetworkFailure value)?  network,TResult Function( ServerFailure value)?  server,TResult Function( PermissionFailure value)?  permissionDenied,TResult Function( RateLimitedFailure value)?  rateLimited,TResult Function( ValidationFailure value)?  validation,TResult Function( UnexpectedFailure value)?  unexpected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that);case ServerFailure() when server != null:
return server(_that);case PermissionFailure() when permissionDenied != null:
return permissionDenied(_that);case RateLimitedFailure() when rateLimited != null:
return rateLimited(_that);case ValidationFailure() when validation != null:
return validation(_that);case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NetworkFailure value)  network,required TResult Function( ServerFailure value)  server,required TResult Function( PermissionFailure value)  permissionDenied,required TResult Function( RateLimitedFailure value)  rateLimited,required TResult Function( ValidationFailure value)  validation,required TResult Function( UnexpectedFailure value)  unexpected,}){
final _that = this;
switch (_that) {
case NetworkFailure():
return network(_that);case ServerFailure():
return server(_that);case PermissionFailure():
return permissionDenied(_that);case RateLimitedFailure():
return rateLimited(_that);case ValidationFailure():
return validation(_that);case UnexpectedFailure():
return unexpected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NetworkFailure value)?  network,TResult? Function( ServerFailure value)?  server,TResult? Function( PermissionFailure value)?  permissionDenied,TResult? Function( RateLimitedFailure value)?  rateLimited,TResult? Function( ValidationFailure value)?  validation,TResult? Function( UnexpectedFailure value)?  unexpected,}){
final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that);case ServerFailure() when server != null:
return server(_that);case PermissionFailure() when permissionDenied != null:
return permissionDenied(_that);case RateLimitedFailure() when rateLimited != null:
return rateLimited(_that);case ValidationFailure() when validation != null:
return validation(_that);case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? debugMessage)?  network,TResult Function( String? debugMessage)?  server,TResult Function( String? debugMessage)?  permissionDenied,TResult Function( String? debugMessage)?  rateLimited,TResult Function( ValidationReason reason,  String? debugMessage)?  validation,TResult Function( String? debugMessage)?  unexpected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that.debugMessage);case ServerFailure() when server != null:
return server(_that.debugMessage);case PermissionFailure() when permissionDenied != null:
return permissionDenied(_that.debugMessage);case RateLimitedFailure() when rateLimited != null:
return rateLimited(_that.debugMessage);case ValidationFailure() when validation != null:
return validation(_that.reason,_that.debugMessage);case UnexpectedFailure() when unexpected != null:
return unexpected(_that.debugMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? debugMessage)  network,required TResult Function( String? debugMessage)  server,required TResult Function( String? debugMessage)  permissionDenied,required TResult Function( String? debugMessage)  rateLimited,required TResult Function( ValidationReason reason,  String? debugMessage)  validation,required TResult Function( String? debugMessage)  unexpected,}) {final _that = this;
switch (_that) {
case NetworkFailure():
return network(_that.debugMessage);case ServerFailure():
return server(_that.debugMessage);case PermissionFailure():
return permissionDenied(_that.debugMessage);case RateLimitedFailure():
return rateLimited(_that.debugMessage);case ValidationFailure():
return validation(_that.reason,_that.debugMessage);case UnexpectedFailure():
return unexpected(_that.debugMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? debugMessage)?  network,TResult? Function( String? debugMessage)?  server,TResult? Function( String? debugMessage)?  permissionDenied,TResult? Function( String? debugMessage)?  rateLimited,TResult? Function( ValidationReason reason,  String? debugMessage)?  validation,TResult? Function( String? debugMessage)?  unexpected,}) {final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that.debugMessage);case ServerFailure() when server != null:
return server(_that.debugMessage);case PermissionFailure() when permissionDenied != null:
return permissionDenied(_that.debugMessage);case RateLimitedFailure() when rateLimited != null:
return rateLimited(_that.debugMessage);case ValidationFailure() when validation != null:
return validation(_that.reason,_that.debugMessage);case UnexpectedFailure() when unexpected != null:
return unexpected(_that.debugMessage);case _:
  return null;

}
}

}

/// @nodoc


class NetworkFailure implements Failure {
  const NetworkFailure({this.debugMessage});
  

@override final  String? debugMessage;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkFailureCopyWith<NetworkFailure> get copyWith => _$NetworkFailureCopyWithImpl<NetworkFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure&&(identical(other.debugMessage, debugMessage) || other.debugMessage == debugMessage));
}


@override
int get hashCode => Object.hash(runtimeType,debugMessage);

@override
String toString() {
  return 'Failure.network(debugMessage: $debugMessage)';
}


}

/// @nodoc
abstract mixin class $NetworkFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(NetworkFailure value, $Res Function(NetworkFailure) _then) = _$NetworkFailureCopyWithImpl;
@override @useResult
$Res call({
 String? debugMessage
});




}
/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._self, this._then);

  final NetworkFailure _self;
  final $Res Function(NetworkFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? debugMessage = freezed,}) {
  return _then(NetworkFailure(
debugMessage: freezed == debugMessage ? _self.debugMessage : debugMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ServerFailure implements Failure {
  const ServerFailure({this.debugMessage});
  

@override final  String? debugMessage;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerFailureCopyWith<ServerFailure> get copyWith => _$ServerFailureCopyWithImpl<ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFailure&&(identical(other.debugMessage, debugMessage) || other.debugMessage == debugMessage));
}


@override
int get hashCode => Object.hash(runtimeType,debugMessage);

@override
String toString() {
  return 'Failure.server(debugMessage: $debugMessage)';
}


}

/// @nodoc
abstract mixin class $ServerFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(ServerFailure value, $Res Function(ServerFailure) _then) = _$ServerFailureCopyWithImpl;
@override @useResult
$Res call({
 String? debugMessage
});




}
/// @nodoc
class _$ServerFailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._self, this._then);

  final ServerFailure _self;
  final $Res Function(ServerFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? debugMessage = freezed,}) {
  return _then(ServerFailure(
debugMessage: freezed == debugMessage ? _self.debugMessage : debugMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PermissionFailure implements Failure {
  const PermissionFailure({this.debugMessage});
  

@override final  String? debugMessage;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionFailureCopyWith<PermissionFailure> get copyWith => _$PermissionFailureCopyWithImpl<PermissionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionFailure&&(identical(other.debugMessage, debugMessage) || other.debugMessage == debugMessage));
}


@override
int get hashCode => Object.hash(runtimeType,debugMessage);

@override
String toString() {
  return 'Failure.permissionDenied(debugMessage: $debugMessage)';
}


}

/// @nodoc
abstract mixin class $PermissionFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $PermissionFailureCopyWith(PermissionFailure value, $Res Function(PermissionFailure) _then) = _$PermissionFailureCopyWithImpl;
@override @useResult
$Res call({
 String? debugMessage
});




}
/// @nodoc
class _$PermissionFailureCopyWithImpl<$Res>
    implements $PermissionFailureCopyWith<$Res> {
  _$PermissionFailureCopyWithImpl(this._self, this._then);

  final PermissionFailure _self;
  final $Res Function(PermissionFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? debugMessage = freezed,}) {
  return _then(PermissionFailure(
debugMessage: freezed == debugMessage ? _self.debugMessage : debugMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class RateLimitedFailure implements Failure {
  const RateLimitedFailure({this.debugMessage});
  

@override final  String? debugMessage;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateLimitedFailureCopyWith<RateLimitedFailure> get copyWith => _$RateLimitedFailureCopyWithImpl<RateLimitedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateLimitedFailure&&(identical(other.debugMessage, debugMessage) || other.debugMessage == debugMessage));
}


@override
int get hashCode => Object.hash(runtimeType,debugMessage);

@override
String toString() {
  return 'Failure.rateLimited(debugMessage: $debugMessage)';
}


}

/// @nodoc
abstract mixin class $RateLimitedFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $RateLimitedFailureCopyWith(RateLimitedFailure value, $Res Function(RateLimitedFailure) _then) = _$RateLimitedFailureCopyWithImpl;
@override @useResult
$Res call({
 String? debugMessage
});




}
/// @nodoc
class _$RateLimitedFailureCopyWithImpl<$Res>
    implements $RateLimitedFailureCopyWith<$Res> {
  _$RateLimitedFailureCopyWithImpl(this._self, this._then);

  final RateLimitedFailure _self;
  final $Res Function(RateLimitedFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? debugMessage = freezed,}) {
  return _then(RateLimitedFailure(
debugMessage: freezed == debugMessage ? _self.debugMessage : debugMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ValidationFailure implements Failure {
  const ValidationFailure({required this.reason, this.debugMessage});
  

 final  ValidationReason reason;
@override final  String? debugMessage;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationFailureCopyWith<ValidationFailure> get copyWith => _$ValidationFailureCopyWithImpl<ValidationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationFailure&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.debugMessage, debugMessage) || other.debugMessage == debugMessage));
}


@override
int get hashCode => Object.hash(runtimeType,reason,debugMessage);

@override
String toString() {
  return 'Failure.validation(reason: $reason, debugMessage: $debugMessage)';
}


}

/// @nodoc
abstract mixin class $ValidationFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ValidationFailureCopyWith(ValidationFailure value, $Res Function(ValidationFailure) _then) = _$ValidationFailureCopyWithImpl;
@override @useResult
$Res call({
 ValidationReason reason, String? debugMessage
});




}
/// @nodoc
class _$ValidationFailureCopyWithImpl<$Res>
    implements $ValidationFailureCopyWith<$Res> {
  _$ValidationFailureCopyWithImpl(this._self, this._then);

  final ValidationFailure _self;
  final $Res Function(ValidationFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? debugMessage = freezed,}) {
  return _then(ValidationFailure(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as ValidationReason,debugMessage: freezed == debugMessage ? _self.debugMessage : debugMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UnexpectedFailure implements Failure {
  const UnexpectedFailure({this.debugMessage});
  

@override final  String? debugMessage;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedFailureCopyWith<UnexpectedFailure> get copyWith => _$UnexpectedFailureCopyWithImpl<UnexpectedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedFailure&&(identical(other.debugMessage, debugMessage) || other.debugMessage == debugMessage));
}


@override
int get hashCode => Object.hash(runtimeType,debugMessage);

@override
String toString() {
  return 'Failure.unexpected(debugMessage: $debugMessage)';
}


}

/// @nodoc
abstract mixin class $UnexpectedFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnexpectedFailureCopyWith(UnexpectedFailure value, $Res Function(UnexpectedFailure) _then) = _$UnexpectedFailureCopyWithImpl;
@override @useResult
$Res call({
 String? debugMessage
});




}
/// @nodoc
class _$UnexpectedFailureCopyWithImpl<$Res>
    implements $UnexpectedFailureCopyWith<$Res> {
  _$UnexpectedFailureCopyWithImpl(this._self, this._then);

  final UnexpectedFailure _self;
  final $Res Function(UnexpectedFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? debugMessage = freezed,}) {
  return _then(UnexpectedFailure(
debugMessage: freezed == debugMessage ? _self.debugMessage : debugMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
