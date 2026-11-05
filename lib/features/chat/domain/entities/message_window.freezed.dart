// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_window.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MessageWindow {

/// Newest first.
 List<Message> get messages;/// `true` when served from the on-device cache (offline / not synced yet).
 bool get isFromCache;
/// Create a copy of MessageWindow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageWindowCopyWith<MessageWindow> get copyWith => _$MessageWindowCopyWithImpl<MessageWindow>(this as MessageWindow, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageWindow&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.isFromCache, isFromCache) || other.isFromCache == isFromCache));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),isFromCache);

@override
String toString() {
  return 'MessageWindow(messages: $messages, isFromCache: $isFromCache)';
}


}

/// @nodoc
abstract mixin class $MessageWindowCopyWith<$Res>  {
  factory $MessageWindowCopyWith(MessageWindow value, $Res Function(MessageWindow) _then) = _$MessageWindowCopyWithImpl;
@useResult
$Res call({
 List<Message> messages, bool isFromCache
});




}
/// @nodoc
class _$MessageWindowCopyWithImpl<$Res>
    implements $MessageWindowCopyWith<$Res> {
  _$MessageWindowCopyWithImpl(this._self, this._then);

  final MessageWindow _self;
  final $Res Function(MessageWindow) _then;

/// Create a copy of MessageWindow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? isFromCache = null,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,isFromCache: null == isFromCache ? _self.isFromCache : isFromCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageWindow].
extension MessageWindowPatterns on MessageWindow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageWindow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageWindow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageWindow value)  $default,){
final _that = this;
switch (_that) {
case _MessageWindow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageWindow value)?  $default,){
final _that = this;
switch (_that) {
case _MessageWindow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Message> messages,  bool isFromCache)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageWindow() when $default != null:
return $default(_that.messages,_that.isFromCache);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Message> messages,  bool isFromCache)  $default,) {final _that = this;
switch (_that) {
case _MessageWindow():
return $default(_that.messages,_that.isFromCache);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Message> messages,  bool isFromCache)?  $default,) {final _that = this;
switch (_that) {
case _MessageWindow() when $default != null:
return $default(_that.messages,_that.isFromCache);case _:
  return null;

}
}

}

/// @nodoc


class _MessageWindow implements MessageWindow {
  const _MessageWindow({required final  List<Message> messages, this.isFromCache = false}): _messages = messages;
  

/// Newest first.
 final  List<Message> _messages;
/// Newest first.
@override List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

/// `true` when served from the on-device cache (offline / not synced yet).
@override@JsonKey() final  bool isFromCache;

/// Create a copy of MessageWindow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageWindowCopyWith<_MessageWindow> get copyWith => __$MessageWindowCopyWithImpl<_MessageWindow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageWindow&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.isFromCache, isFromCache) || other.isFromCache == isFromCache));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),isFromCache);

@override
String toString() {
  return 'MessageWindow(messages: $messages, isFromCache: $isFromCache)';
}


}

/// @nodoc
abstract mixin class _$MessageWindowCopyWith<$Res> implements $MessageWindowCopyWith<$Res> {
  factory _$MessageWindowCopyWith(_MessageWindow value, $Res Function(_MessageWindow) _then) = __$MessageWindowCopyWithImpl;
@override @useResult
$Res call({
 List<Message> messages, bool isFromCache
});




}
/// @nodoc
class __$MessageWindowCopyWithImpl<$Res>
    implements _$MessageWindowCopyWith<$Res> {
  __$MessageWindowCopyWithImpl(this._self, this._then);

  final _MessageWindow _self;
  final $Res Function(_MessageWindow) _then;

/// Create a copy of MessageWindow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? isFromCache = null,}) {
  return _then(_MessageWindow(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,isFromCache: null == isFromCache ? _self.isFromCache : isFromCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
