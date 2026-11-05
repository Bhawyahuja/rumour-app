// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatItem {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatItem);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatItem()';
}


}

/// @nodoc
class $ChatItemCopyWith<$Res>  {
$ChatItemCopyWith(ChatItem _, $Res Function(ChatItem) __);
}


/// Adds pattern-matching-related methods to [ChatItem].
extension ChatItemPatterns on ChatItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatDaySeparator value)?  daySeparator,TResult Function( ChatMessageItem value)?  message,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatDaySeparator() when daySeparator != null:
return daySeparator(_that);case ChatMessageItem() when message != null:
return message(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatDaySeparator value)  daySeparator,required TResult Function( ChatMessageItem value)  message,}){
final _that = this;
switch (_that) {
case ChatDaySeparator():
return daySeparator(_that);case ChatMessageItem():
return message(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatDaySeparator value)?  daySeparator,TResult? Function( ChatMessageItem value)?  message,}){
final _that = this;
switch (_that) {
case ChatDaySeparator() when daySeparator != null:
return daySeparator(_that);case ChatMessageItem() when message != null:
return message(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  DateTime day,  bool isTopMost)?  daySeparator,TResult Function( Message message,  bool showSender,  double topSpacing,  bool animateIn)?  message,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatDaySeparator() when daySeparator != null:
return daySeparator(_that.id,_that.day,_that.isTopMost);case ChatMessageItem() when message != null:
return message(_that.message,_that.showSender,_that.topSpacing,_that.animateIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  DateTime day,  bool isTopMost)  daySeparator,required TResult Function( Message message,  bool showSender,  double topSpacing,  bool animateIn)  message,}) {final _that = this;
switch (_that) {
case ChatDaySeparator():
return daySeparator(_that.id,_that.day,_that.isTopMost);case ChatMessageItem():
return message(_that.message,_that.showSender,_that.topSpacing,_that.animateIn);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  DateTime day,  bool isTopMost)?  daySeparator,TResult? Function( Message message,  bool showSender,  double topSpacing,  bool animateIn)?  message,}) {final _that = this;
switch (_that) {
case ChatDaySeparator() when daySeparator != null:
return daySeparator(_that.id,_that.day,_that.isTopMost);case ChatMessageItem() when message != null:
return message(_that.message,_that.showSender,_that.topSpacing,_that.animateIn);case _:
  return null;

}
}

}

/// @nodoc


class ChatDaySeparator implements ChatItem {
  const ChatDaySeparator({required this.id, required this.day, this.isTopMost = false});
  

 final  String id;
/// Local midnight of the day this separator introduces.
 final  DateTime day;
/// The oldest loaded day sits at the very top and needs no top gap.
@JsonKey() final  bool isTopMost;

/// Create a copy of ChatItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatDaySeparatorCopyWith<ChatDaySeparator> get copyWith => _$ChatDaySeparatorCopyWithImpl<ChatDaySeparator>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatDaySeparator&&(identical(other.id, id) || other.id == id)&&(identical(other.day, day) || other.day == day)&&(identical(other.isTopMost, isTopMost) || other.isTopMost == isTopMost));
}


@override
int get hashCode => Object.hash(runtimeType,id,day,isTopMost);

@override
String toString() {
  return 'ChatItem.daySeparator(id: $id, day: $day, isTopMost: $isTopMost)';
}


}

/// @nodoc
abstract mixin class $ChatDaySeparatorCopyWith<$Res> implements $ChatItemCopyWith<$Res> {
  factory $ChatDaySeparatorCopyWith(ChatDaySeparator value, $Res Function(ChatDaySeparator) _then) = _$ChatDaySeparatorCopyWithImpl;
@useResult
$Res call({
 String id, DateTime day, bool isTopMost
});




}
/// @nodoc
class _$ChatDaySeparatorCopyWithImpl<$Res>
    implements $ChatDaySeparatorCopyWith<$Res> {
  _$ChatDaySeparatorCopyWithImpl(this._self, this._then);

  final ChatDaySeparator _self;
  final $Res Function(ChatDaySeparator) _then;

/// Create a copy of ChatItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? day = null,Object? isTopMost = null,}) {
  return _then(ChatDaySeparator(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DateTime,isTopMost: null == isTopMost ? _self.isTopMost : isTopMost // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ChatMessageItem implements ChatItem {
  const ChatMessageItem({required this.message, required this.showSender, required this.topSpacing, this.animateIn = false});
  

 final  Message message;
/// First message of a run from the same sender → show "@handle"/"You".
 final  bool showSender;
/// Gap above this row in logical pixels.
 final  double topSpacing;
/// Arrived live (not part of the initial history) → slide in.
@JsonKey() final  bool animateIn;

/// Create a copy of ChatItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageItemCopyWith<ChatMessageItem> get copyWith => _$ChatMessageItemCopyWithImpl<ChatMessageItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessageItem&&(identical(other.message, message) || other.message == message)&&(identical(other.showSender, showSender) || other.showSender == showSender)&&(identical(other.topSpacing, topSpacing) || other.topSpacing == topSpacing)&&(identical(other.animateIn, animateIn) || other.animateIn == animateIn));
}


@override
int get hashCode => Object.hash(runtimeType,message,showSender,topSpacing,animateIn);

@override
String toString() {
  return 'ChatItem.message(message: $message, showSender: $showSender, topSpacing: $topSpacing, animateIn: $animateIn)';
}


}

/// @nodoc
abstract mixin class $ChatMessageItemCopyWith<$Res> implements $ChatItemCopyWith<$Res> {
  factory $ChatMessageItemCopyWith(ChatMessageItem value, $Res Function(ChatMessageItem) _then) = _$ChatMessageItemCopyWithImpl;
@useResult
$Res call({
 Message message, bool showSender, double topSpacing, bool animateIn
});


$MessageCopyWith<$Res> get message;

}
/// @nodoc
class _$ChatMessageItemCopyWithImpl<$Res>
    implements $ChatMessageItemCopyWith<$Res> {
  _$ChatMessageItemCopyWithImpl(this._self, this._then);

  final ChatMessageItem _self;
  final $Res Function(ChatMessageItem) _then;

/// Create a copy of ChatItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? showSender = null,Object? topSpacing = null,Object? animateIn = null,}) {
  return _then(ChatMessageItem(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,showSender: null == showSender ? _self.showSender : showSender // ignore: cast_nullable_to_non_nullable
as bool,topSpacing: null == topSpacing ? _self.topSpacing : topSpacing // ignore: cast_nullable_to_non_nullable
as double,animateIn: null == animateIn ? _self.animateIn : animateIn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ChatItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get message {
  
  return $MessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

// dart format on
