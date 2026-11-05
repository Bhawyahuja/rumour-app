// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_room_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JoinRoomState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinRoomState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JoinRoomState()';
}


}

/// @nodoc
class $JoinRoomStateCopyWith<$Res>  {
$JoinRoomStateCopyWith(JoinRoomState _, $Res Function(JoinRoomState) __);
}


/// Adds pattern-matching-related methods to [JoinRoomState].
extension JoinRoomStatePatterns on JoinRoomState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( JoinRoomIdle value)?  idle,TResult Function( JoinRoomChecking value)?  checking,TResult Function( JoinRoomNeedsIdentity value)?  needsIdentity,TResult Function( JoinRoomAlreadyMember value)?  alreadyMember,TResult Function( JoinRoomFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case JoinRoomIdle() when idle != null:
return idle(_that);case JoinRoomChecking() when checking != null:
return checking(_that);case JoinRoomNeedsIdentity() when needsIdentity != null:
return needsIdentity(_that);case JoinRoomAlreadyMember() when alreadyMember != null:
return alreadyMember(_that);case JoinRoomFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( JoinRoomIdle value)  idle,required TResult Function( JoinRoomChecking value)  checking,required TResult Function( JoinRoomNeedsIdentity value)  needsIdentity,required TResult Function( JoinRoomAlreadyMember value)  alreadyMember,required TResult Function( JoinRoomFailure value)  failure,}){
final _that = this;
switch (_that) {
case JoinRoomIdle():
return idle(_that);case JoinRoomChecking():
return checking(_that);case JoinRoomNeedsIdentity():
return needsIdentity(_that);case JoinRoomAlreadyMember():
return alreadyMember(_that);case JoinRoomFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( JoinRoomIdle value)?  idle,TResult? Function( JoinRoomChecking value)?  checking,TResult? Function( JoinRoomNeedsIdentity value)?  needsIdentity,TResult? Function( JoinRoomAlreadyMember value)?  alreadyMember,TResult? Function( JoinRoomFailure value)?  failure,}){
final _that = this;
switch (_that) {
case JoinRoomIdle() when idle != null:
return idle(_that);case JoinRoomChecking() when checking != null:
return checking(_that);case JoinRoomNeedsIdentity() when needsIdentity != null:
return needsIdentity(_that);case JoinRoomAlreadyMember() when alreadyMember != null:
return alreadyMember(_that);case JoinRoomFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( String code)?  checking,TResult Function( String code)?  needsIdentity,TResult Function( Member member)?  alreadyMember,TResult Function( Failure failure,  int attempt)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case JoinRoomIdle() when idle != null:
return idle();case JoinRoomChecking() when checking != null:
return checking(_that.code);case JoinRoomNeedsIdentity() when needsIdentity != null:
return needsIdentity(_that.code);case JoinRoomAlreadyMember() when alreadyMember != null:
return alreadyMember(_that.member);case JoinRoomFailure() when failure != null:
return failure(_that.failure,_that.attempt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( String code)  checking,required TResult Function( String code)  needsIdentity,required TResult Function( Member member)  alreadyMember,required TResult Function( Failure failure,  int attempt)  failure,}) {final _that = this;
switch (_that) {
case JoinRoomIdle():
return idle();case JoinRoomChecking():
return checking(_that.code);case JoinRoomNeedsIdentity():
return needsIdentity(_that.code);case JoinRoomAlreadyMember():
return alreadyMember(_that.member);case JoinRoomFailure():
return failure(_that.failure,_that.attempt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( String code)?  checking,TResult? Function( String code)?  needsIdentity,TResult? Function( Member member)?  alreadyMember,TResult? Function( Failure failure,  int attempt)?  failure,}) {final _that = this;
switch (_that) {
case JoinRoomIdle() when idle != null:
return idle();case JoinRoomChecking() when checking != null:
return checking(_that.code);case JoinRoomNeedsIdentity() when needsIdentity != null:
return needsIdentity(_that.code);case JoinRoomAlreadyMember() when alreadyMember != null:
return alreadyMember(_that.member);case JoinRoomFailure() when failure != null:
return failure(_that.failure,_that.attempt);case _:
  return null;

}
}

}

/// @nodoc


class JoinRoomIdle extends JoinRoomState {
  const JoinRoomIdle(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinRoomIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JoinRoomState.idle()';
}


}




/// @nodoc


class JoinRoomChecking extends JoinRoomState {
  const JoinRoomChecking({required this.code}): super._();
  

 final  String code;

/// Create a copy of JoinRoomState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinRoomCheckingCopyWith<JoinRoomChecking> get copyWith => _$JoinRoomCheckingCopyWithImpl<JoinRoomChecking>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinRoomChecking&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,code);

@override
String toString() {
  return 'JoinRoomState.checking(code: $code)';
}


}

/// @nodoc
abstract mixin class $JoinRoomCheckingCopyWith<$Res> implements $JoinRoomStateCopyWith<$Res> {
  factory $JoinRoomCheckingCopyWith(JoinRoomChecking value, $Res Function(JoinRoomChecking) _then) = _$JoinRoomCheckingCopyWithImpl;
@useResult
$Res call({
 String code
});




}
/// @nodoc
class _$JoinRoomCheckingCopyWithImpl<$Res>
    implements $JoinRoomCheckingCopyWith<$Res> {
  _$JoinRoomCheckingCopyWithImpl(this._self, this._then);

  final JoinRoomChecking _self;
  final $Res Function(JoinRoomChecking) _then;

/// Create a copy of JoinRoomState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,}) {
  return _then(JoinRoomChecking(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class JoinRoomNeedsIdentity extends JoinRoomState {
  const JoinRoomNeedsIdentity({required this.code}): super._();
  

 final  String code;

/// Create a copy of JoinRoomState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinRoomNeedsIdentityCopyWith<JoinRoomNeedsIdentity> get copyWith => _$JoinRoomNeedsIdentityCopyWithImpl<JoinRoomNeedsIdentity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinRoomNeedsIdentity&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,code);

@override
String toString() {
  return 'JoinRoomState.needsIdentity(code: $code)';
}


}

/// @nodoc
abstract mixin class $JoinRoomNeedsIdentityCopyWith<$Res> implements $JoinRoomStateCopyWith<$Res> {
  factory $JoinRoomNeedsIdentityCopyWith(JoinRoomNeedsIdentity value, $Res Function(JoinRoomNeedsIdentity) _then) = _$JoinRoomNeedsIdentityCopyWithImpl;
@useResult
$Res call({
 String code
});




}
/// @nodoc
class _$JoinRoomNeedsIdentityCopyWithImpl<$Res>
    implements $JoinRoomNeedsIdentityCopyWith<$Res> {
  _$JoinRoomNeedsIdentityCopyWithImpl(this._self, this._then);

  final JoinRoomNeedsIdentity _self;
  final $Res Function(JoinRoomNeedsIdentity) _then;

/// Create a copy of JoinRoomState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,}) {
  return _then(JoinRoomNeedsIdentity(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class JoinRoomAlreadyMember extends JoinRoomState {
  const JoinRoomAlreadyMember({required this.member}): super._();
  

 final  Member member;

/// Create a copy of JoinRoomState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinRoomAlreadyMemberCopyWith<JoinRoomAlreadyMember> get copyWith => _$JoinRoomAlreadyMemberCopyWithImpl<JoinRoomAlreadyMember>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinRoomAlreadyMember&&(identical(other.member, member) || other.member == member));
}


@override
int get hashCode => Object.hash(runtimeType,member);

@override
String toString() {
  return 'JoinRoomState.alreadyMember(member: $member)';
}


}

/// @nodoc
abstract mixin class $JoinRoomAlreadyMemberCopyWith<$Res> implements $JoinRoomStateCopyWith<$Res> {
  factory $JoinRoomAlreadyMemberCopyWith(JoinRoomAlreadyMember value, $Res Function(JoinRoomAlreadyMember) _then) = _$JoinRoomAlreadyMemberCopyWithImpl;
@useResult
$Res call({
 Member member
});


$MemberCopyWith<$Res> get member;

}
/// @nodoc
class _$JoinRoomAlreadyMemberCopyWithImpl<$Res>
    implements $JoinRoomAlreadyMemberCopyWith<$Res> {
  _$JoinRoomAlreadyMemberCopyWithImpl(this._self, this._then);

  final JoinRoomAlreadyMember _self;
  final $Res Function(JoinRoomAlreadyMember) _then;

/// Create a copy of JoinRoomState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? member = null,}) {
  return _then(JoinRoomAlreadyMember(
member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as Member,
  ));
}

/// Create a copy of JoinRoomState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemberCopyWith<$Res> get member {
  
  return $MemberCopyWith<$Res>(_self.member, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}

/// @nodoc


class JoinRoomFailure extends JoinRoomState {
  const JoinRoomFailure({required this.failure, required this.attempt}): super._();
  

 final  Failure failure;
 final  int attempt;

/// Create a copy of JoinRoomState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinRoomFailureCopyWith<JoinRoomFailure> get copyWith => _$JoinRoomFailureCopyWithImpl<JoinRoomFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinRoomFailure&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.attempt, attempt) || other.attempt == attempt));
}


@override
int get hashCode => Object.hash(runtimeType,failure,attempt);

@override
String toString() {
  return 'JoinRoomState.failure(failure: $failure, attempt: $attempt)';
}


}

/// @nodoc
abstract mixin class $JoinRoomFailureCopyWith<$Res> implements $JoinRoomStateCopyWith<$Res> {
  factory $JoinRoomFailureCopyWith(JoinRoomFailure value, $Res Function(JoinRoomFailure) _then) = _$JoinRoomFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure, int attempt
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$JoinRoomFailureCopyWithImpl<$Res>
    implements $JoinRoomFailureCopyWith<$Res> {
  _$JoinRoomFailureCopyWithImpl(this._self, this._then);

  final JoinRoomFailure _self;
  final $Res Function(JoinRoomFailure) _then;

/// Create a copy of JoinRoomState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? attempt = null,}) {
  return _then(JoinRoomFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,attempt: null == attempt ? _self.attempt : attempt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of JoinRoomState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
