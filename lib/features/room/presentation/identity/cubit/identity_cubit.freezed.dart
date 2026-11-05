// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identity_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IdentityState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdentityState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IdentityState()';
}


}

/// @nodoc
class $IdentityStateCopyWith<$Res>  {
$IdentityStateCopyWith(IdentityState _, $Res Function(IdentityState) __);
}


/// Adds pattern-matching-related methods to [IdentityState].
extension IdentityStatePatterns on IdentityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( IdentityGenerating value)?  generating,TResult Function( IdentityReady value)?  ready,TResult Function( IdentityJoining value)?  joining,TResult Function( IdentityJoined value)?  joined,TResult Function( IdentityFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case IdentityGenerating() when generating != null:
return generating(_that);case IdentityReady() when ready != null:
return ready(_that);case IdentityJoining() when joining != null:
return joining(_that);case IdentityJoined() when joined != null:
return joined(_that);case IdentityFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( IdentityGenerating value)  generating,required TResult Function( IdentityReady value)  ready,required TResult Function( IdentityJoining value)  joining,required TResult Function( IdentityJoined value)  joined,required TResult Function( IdentityFailure value)  failure,}){
final _that = this;
switch (_that) {
case IdentityGenerating():
return generating(_that);case IdentityReady():
return ready(_that);case IdentityJoining():
return joining(_that);case IdentityJoined():
return joined(_that);case IdentityFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( IdentityGenerating value)?  generating,TResult? Function( IdentityReady value)?  ready,TResult? Function( IdentityJoining value)?  joining,TResult? Function( IdentityJoined value)?  joined,TResult? Function( IdentityFailure value)?  failure,}){
final _that = this;
switch (_that) {
case IdentityGenerating() when generating != null:
return generating(_that);case IdentityReady() when ready != null:
return ready(_that);case IdentityJoining() when joining != null:
return joining(_that);case IdentityJoined() when joined != null:
return joined(_that);case IdentityFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  generating,TResult Function( Alias alias)?  ready,TResult Function( Alias alias)?  joining,TResult Function( Member member)?  joined,TResult Function( Failure failure,  Alias? alias)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case IdentityGenerating() when generating != null:
return generating();case IdentityReady() when ready != null:
return ready(_that.alias);case IdentityJoining() when joining != null:
return joining(_that.alias);case IdentityJoined() when joined != null:
return joined(_that.member);case IdentityFailure() when failure != null:
return failure(_that.failure,_that.alias);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  generating,required TResult Function( Alias alias)  ready,required TResult Function( Alias alias)  joining,required TResult Function( Member member)  joined,required TResult Function( Failure failure,  Alias? alias)  failure,}) {final _that = this;
switch (_that) {
case IdentityGenerating():
return generating();case IdentityReady():
return ready(_that.alias);case IdentityJoining():
return joining(_that.alias);case IdentityJoined():
return joined(_that.member);case IdentityFailure():
return failure(_that.failure,_that.alias);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  generating,TResult? Function( Alias alias)?  ready,TResult? Function( Alias alias)?  joining,TResult? Function( Member member)?  joined,TResult? Function( Failure failure,  Alias? alias)?  failure,}) {final _that = this;
switch (_that) {
case IdentityGenerating() when generating != null:
return generating();case IdentityReady() when ready != null:
return ready(_that.alias);case IdentityJoining() when joining != null:
return joining(_that.alias);case IdentityJoined() when joined != null:
return joined(_that.member);case IdentityFailure() when failure != null:
return failure(_that.failure,_that.alias);case _:
  return null;

}
}

}

/// @nodoc


class IdentityGenerating extends IdentityState {
  const IdentityGenerating(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdentityGenerating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IdentityState.generating()';
}


}




/// @nodoc


class IdentityReady extends IdentityState {
  const IdentityReady({required this.alias}): super._();
  

 final  Alias alias;

/// Create a copy of IdentityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdentityReadyCopyWith<IdentityReady> get copyWith => _$IdentityReadyCopyWithImpl<IdentityReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdentityReady&&(identical(other.alias, alias) || other.alias == alias));
}


@override
int get hashCode => Object.hash(runtimeType,alias);

@override
String toString() {
  return 'IdentityState.ready(alias: $alias)';
}


}

/// @nodoc
abstract mixin class $IdentityReadyCopyWith<$Res> implements $IdentityStateCopyWith<$Res> {
  factory $IdentityReadyCopyWith(IdentityReady value, $Res Function(IdentityReady) _then) = _$IdentityReadyCopyWithImpl;
@useResult
$Res call({
 Alias alias
});


$AliasCopyWith<$Res> get alias;

}
/// @nodoc
class _$IdentityReadyCopyWithImpl<$Res>
    implements $IdentityReadyCopyWith<$Res> {
  _$IdentityReadyCopyWithImpl(this._self, this._then);

  final IdentityReady _self;
  final $Res Function(IdentityReady) _then;

/// Create a copy of IdentityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alias = null,}) {
  return _then(IdentityReady(
alias: null == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as Alias,
  ));
}

/// Create a copy of IdentityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AliasCopyWith<$Res> get alias {
  
  return $AliasCopyWith<$Res>(_self.alias, (value) {
    return _then(_self.copyWith(alias: value));
  });
}
}

/// @nodoc


class IdentityJoining extends IdentityState {
  const IdentityJoining({required this.alias}): super._();
  

 final  Alias alias;

/// Create a copy of IdentityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdentityJoiningCopyWith<IdentityJoining> get copyWith => _$IdentityJoiningCopyWithImpl<IdentityJoining>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdentityJoining&&(identical(other.alias, alias) || other.alias == alias));
}


@override
int get hashCode => Object.hash(runtimeType,alias);

@override
String toString() {
  return 'IdentityState.joining(alias: $alias)';
}


}

/// @nodoc
abstract mixin class $IdentityJoiningCopyWith<$Res> implements $IdentityStateCopyWith<$Res> {
  factory $IdentityJoiningCopyWith(IdentityJoining value, $Res Function(IdentityJoining) _then) = _$IdentityJoiningCopyWithImpl;
@useResult
$Res call({
 Alias alias
});


$AliasCopyWith<$Res> get alias;

}
/// @nodoc
class _$IdentityJoiningCopyWithImpl<$Res>
    implements $IdentityJoiningCopyWith<$Res> {
  _$IdentityJoiningCopyWithImpl(this._self, this._then);

  final IdentityJoining _self;
  final $Res Function(IdentityJoining) _then;

/// Create a copy of IdentityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alias = null,}) {
  return _then(IdentityJoining(
alias: null == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as Alias,
  ));
}

/// Create a copy of IdentityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AliasCopyWith<$Res> get alias {
  
  return $AliasCopyWith<$Res>(_self.alias, (value) {
    return _then(_self.copyWith(alias: value));
  });
}
}

/// @nodoc


class IdentityJoined extends IdentityState {
  const IdentityJoined({required this.member}): super._();
  

 final  Member member;

/// Create a copy of IdentityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdentityJoinedCopyWith<IdentityJoined> get copyWith => _$IdentityJoinedCopyWithImpl<IdentityJoined>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdentityJoined&&(identical(other.member, member) || other.member == member));
}


@override
int get hashCode => Object.hash(runtimeType,member);

@override
String toString() {
  return 'IdentityState.joined(member: $member)';
}


}

/// @nodoc
abstract mixin class $IdentityJoinedCopyWith<$Res> implements $IdentityStateCopyWith<$Res> {
  factory $IdentityJoinedCopyWith(IdentityJoined value, $Res Function(IdentityJoined) _then) = _$IdentityJoinedCopyWithImpl;
@useResult
$Res call({
 Member member
});


$MemberCopyWith<$Res> get member;

}
/// @nodoc
class _$IdentityJoinedCopyWithImpl<$Res>
    implements $IdentityJoinedCopyWith<$Res> {
  _$IdentityJoinedCopyWithImpl(this._self, this._then);

  final IdentityJoined _self;
  final $Res Function(IdentityJoined) _then;

/// Create a copy of IdentityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? member = null,}) {
  return _then(IdentityJoined(
member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as Member,
  ));
}

/// Create a copy of IdentityState
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


class IdentityFailure extends IdentityState {
  const IdentityFailure({required this.failure, this.alias}): super._();
  

 final  Failure failure;
 final  Alias? alias;

/// Create a copy of IdentityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdentityFailureCopyWith<IdentityFailure> get copyWith => _$IdentityFailureCopyWithImpl<IdentityFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdentityFailure&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.alias, alias) || other.alias == alias));
}


@override
int get hashCode => Object.hash(runtimeType,failure,alias);

@override
String toString() {
  return 'IdentityState.failure(failure: $failure, alias: $alias)';
}


}

/// @nodoc
abstract mixin class $IdentityFailureCopyWith<$Res> implements $IdentityStateCopyWith<$Res> {
  factory $IdentityFailureCopyWith(IdentityFailure value, $Res Function(IdentityFailure) _then) = _$IdentityFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure, Alias? alias
});


$FailureCopyWith<$Res> get failure;$AliasCopyWith<$Res>? get alias;

}
/// @nodoc
class _$IdentityFailureCopyWithImpl<$Res>
    implements $IdentityFailureCopyWith<$Res> {
  _$IdentityFailureCopyWithImpl(this._self, this._then);

  final IdentityFailure _self;
  final $Res Function(IdentityFailure) _then;

/// Create a copy of IdentityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? alias = freezed,}) {
  return _then(IdentityFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,alias: freezed == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as Alias?,
  ));
}

/// Create a copy of IdentityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}/// Create a copy of IdentityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AliasCopyWith<$Res>? get alias {
    if (_self.alias == null) {
    return null;
  }

  return $AliasCopyWith<$Res>(_self.alias!, (value) {
    return _then(_self.copyWith(alias: value));
  });
}
}

// dart format on
