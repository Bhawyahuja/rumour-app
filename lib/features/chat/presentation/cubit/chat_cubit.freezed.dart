// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatNotice {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatNotice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatNotice()';
}


}

/// @nodoc
class $ChatNoticeCopyWith<$Res>  {
$ChatNoticeCopyWith(ChatNotice _, $Res Function(ChatNotice) __);
}


/// Adds pattern-matching-related methods to [ChatNotice].
extension ChatNoticePatterns on ChatNotice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatNoticeCopied value)?  copied,TResult Function( ChatNoticeCopyFailed value)?  copyFailed,TResult Function( ChatNoticeFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatNoticeCopied() when copied != null:
return copied(_that);case ChatNoticeCopyFailed() when copyFailed != null:
return copyFailed(_that);case ChatNoticeFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatNoticeCopied value)  copied,required TResult Function( ChatNoticeCopyFailed value)  copyFailed,required TResult Function( ChatNoticeFailure value)  failure,}){
final _that = this;
switch (_that) {
case ChatNoticeCopied():
return copied(_that);case ChatNoticeCopyFailed():
return copyFailed(_that);case ChatNoticeFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatNoticeCopied value)?  copied,TResult? Function( ChatNoticeCopyFailed value)?  copyFailed,TResult? Function( ChatNoticeFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ChatNoticeCopied() when copied != null:
return copied(_that);case ChatNoticeCopyFailed() when copyFailed != null:
return copyFailed(_that);case ChatNoticeFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  copied,TResult Function()?  copyFailed,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatNoticeCopied() when copied != null:
return copied();case ChatNoticeCopyFailed() when copyFailed != null:
return copyFailed();case ChatNoticeFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  copied,required TResult Function()  copyFailed,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case ChatNoticeCopied():
return copied();case ChatNoticeCopyFailed():
return copyFailed();case ChatNoticeFailure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  copied,TResult? Function()?  copyFailed,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case ChatNoticeCopied() when copied != null:
return copied();case ChatNoticeCopyFailed() when copyFailed != null:
return copyFailed();case ChatNoticeFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class ChatNoticeCopied implements ChatNotice {
  const ChatNoticeCopied();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatNoticeCopied);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatNotice.copied()';
}


}




/// @nodoc


class ChatNoticeCopyFailed implements ChatNotice {
  const ChatNoticeCopyFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatNoticeCopyFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatNotice.copyFailed()';
}


}




/// @nodoc


class ChatNoticeFailure implements ChatNotice {
  const ChatNoticeFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of ChatNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatNoticeFailureCopyWith<ChatNoticeFailure> get copyWith => _$ChatNoticeFailureCopyWithImpl<ChatNoticeFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatNoticeFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ChatNotice.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ChatNoticeFailureCopyWith<$Res> implements $ChatNoticeCopyWith<$Res> {
  factory $ChatNoticeFailureCopyWith(ChatNoticeFailure value, $Res Function(ChatNoticeFailure) _then) = _$ChatNoticeFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$ChatNoticeFailureCopyWithImpl<$Res>
    implements $ChatNoticeFailureCopyWith<$Res> {
  _$ChatNoticeFailureCopyWithImpl(this._self, this._then);

  final ChatNoticeFailure _self;
  final $Res Function(ChatNoticeFailure) _then;

/// Create a copy of ChatNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ChatNoticeFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of ChatNotice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

/// @nodoc
mixin _$ChatState {

 ChatStatus get status;/// Newest first (source of truth for pagination).
 List<Message> get messages;/// Render-ready rows derived from [messages].
 List<ChatItem> get items; bool get hasMore; bool get isLoadingMore;/// Not synced with the server for a while (debounced).
 bool get isOffline;/// New incoming messages received while scrolled away from the bottom.
 int get unreadCount;/// Bumped when the list should jump to the newest message.
 int get scrollToLatestTick;/// Blocking error for the initial load.
 Failure? get failure;/// One-off feedback; [noticeId] changes every time so repeats still show.
 ChatNotice? get notice; int get noticeId;
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStateCopyWith<ChatState> get copyWith => _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.messages, messages)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isOffline, isOffline) || other.isOffline == isOffline)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.scrollToLatestTick, scrollToLatestTick) || other.scrollToLatestTick == scrollToLatestTick)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.noticeId, noticeId) || other.noticeId == noticeId));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(messages),const DeepCollectionEquality().hash(items),hasMore,isLoadingMore,isOffline,unreadCount,scrollToLatestTick,failure,notice,noticeId);

@override
String toString() {
  return 'ChatState(status: $status, messages: $messages, items: $items, hasMore: $hasMore, isLoadingMore: $isLoadingMore, isOffline: $isOffline, unreadCount: $unreadCount, scrollToLatestTick: $scrollToLatestTick, failure: $failure, notice: $notice, noticeId: $noticeId)';
}


}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res>  {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) = _$ChatStateCopyWithImpl;
@useResult
$Res call({
 ChatStatus status, List<Message> messages, List<ChatItem> items, bool hasMore, bool isLoadingMore, bool isOffline, int unreadCount, int scrollToLatestTick, Failure? failure, ChatNotice? notice, int noticeId
});


$FailureCopyWith<$Res>? get failure;$ChatNoticeCopyWith<$Res>? get notice;

}
/// @nodoc
class _$ChatStateCopyWithImpl<$Res>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? messages = null,Object? items = null,Object? hasMore = null,Object? isLoadingMore = null,Object? isOffline = null,Object? unreadCount = null,Object? scrollToLatestTick = null,Object? failure = freezed,Object? notice = freezed,Object? noticeId = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatStatus,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ChatItem>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isOffline: null == isOffline ? _self.isOffline : isOffline // ignore: cast_nullable_to_non_nullable
as bool,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,scrollToLatestTick: null == scrollToLatestTick ? _self.scrollToLatestTick : scrollToLatestTick // ignore: cast_nullable_to_non_nullable
as int,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as ChatNotice?,noticeId: null == noticeId ? _self.noticeId : noticeId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatNoticeCopyWith<$Res>? get notice {
    if (_self.notice == null) {
    return null;
  }

  return $ChatNoticeCopyWith<$Res>(_self.notice!, (value) {
    return _then(_self.copyWith(notice: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatState value)  $default,){
final _that = this;
switch (_that) {
case _ChatState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChatStatus status,  List<Message> messages,  List<ChatItem> items,  bool hasMore,  bool isLoadingMore,  bool isOffline,  int unreadCount,  int scrollToLatestTick,  Failure? failure,  ChatNotice? notice,  int noticeId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.status,_that.messages,_that.items,_that.hasMore,_that.isLoadingMore,_that.isOffline,_that.unreadCount,_that.scrollToLatestTick,_that.failure,_that.notice,_that.noticeId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChatStatus status,  List<Message> messages,  List<ChatItem> items,  bool hasMore,  bool isLoadingMore,  bool isOffline,  int unreadCount,  int scrollToLatestTick,  Failure? failure,  ChatNotice? notice,  int noticeId)  $default,) {final _that = this;
switch (_that) {
case _ChatState():
return $default(_that.status,_that.messages,_that.items,_that.hasMore,_that.isLoadingMore,_that.isOffline,_that.unreadCount,_that.scrollToLatestTick,_that.failure,_that.notice,_that.noticeId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChatStatus status,  List<Message> messages,  List<ChatItem> items,  bool hasMore,  bool isLoadingMore,  bool isOffline,  int unreadCount,  int scrollToLatestTick,  Failure? failure,  ChatNotice? notice,  int noticeId)?  $default,) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.status,_that.messages,_that.items,_that.hasMore,_that.isLoadingMore,_that.isOffline,_that.unreadCount,_that.scrollToLatestTick,_that.failure,_that.notice,_that.noticeId);case _:
  return null;

}
}

}

/// @nodoc


class _ChatState extends ChatState {
  const _ChatState({this.status = ChatStatus.loading, final  List<Message> messages = const <Message>[], final  List<ChatItem> items = const <ChatItem>[], this.hasMore = false, this.isLoadingMore = false, this.isOffline = false, this.unreadCount = 0, this.scrollToLatestTick = 0, this.failure, this.notice, this.noticeId = 0}): _messages = messages,_items = items,super._();
  

@override@JsonKey() final  ChatStatus status;
/// Newest first (source of truth for pagination).
 final  List<Message> _messages;
/// Newest first (source of truth for pagination).
@override@JsonKey() List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

/// Render-ready rows derived from [messages].
 final  List<ChatItem> _items;
/// Render-ready rows derived from [messages].
@override@JsonKey() List<ChatItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isLoadingMore;
/// Not synced with the server for a while (debounced).
@override@JsonKey() final  bool isOffline;
/// New incoming messages received while scrolled away from the bottom.
@override@JsonKey() final  int unreadCount;
/// Bumped when the list should jump to the newest message.
@override@JsonKey() final  int scrollToLatestTick;
/// Blocking error for the initial load.
@override final  Failure? failure;
/// One-off feedback; [noticeId] changes every time so repeats still show.
@override final  ChatNotice? notice;
@override@JsonKey() final  int noticeId;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatStateCopyWith<_ChatState> get copyWith => __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._messages, _messages)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isOffline, isOffline) || other.isOffline == isOffline)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.scrollToLatestTick, scrollToLatestTick) || other.scrollToLatestTick == scrollToLatestTick)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.noticeId, noticeId) || other.noticeId == noticeId));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_messages),const DeepCollectionEquality().hash(_items),hasMore,isLoadingMore,isOffline,unreadCount,scrollToLatestTick,failure,notice,noticeId);

@override
String toString() {
  return 'ChatState(status: $status, messages: $messages, items: $items, hasMore: $hasMore, isLoadingMore: $isLoadingMore, isOffline: $isOffline, unreadCount: $unreadCount, scrollToLatestTick: $scrollToLatestTick, failure: $failure, notice: $notice, noticeId: $noticeId)';
}


}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(_ChatState value, $Res Function(_ChatState) _then) = __$ChatStateCopyWithImpl;
@override @useResult
$Res call({
 ChatStatus status, List<Message> messages, List<ChatItem> items, bool hasMore, bool isLoadingMore, bool isOffline, int unreadCount, int scrollToLatestTick, Failure? failure, ChatNotice? notice, int noticeId
});


@override $FailureCopyWith<$Res>? get failure;@override $ChatNoticeCopyWith<$Res>? get notice;

}
/// @nodoc
class __$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? messages = null,Object? items = null,Object? hasMore = null,Object? isLoadingMore = null,Object? isOffline = null,Object? unreadCount = null,Object? scrollToLatestTick = null,Object? failure = freezed,Object? notice = freezed,Object? noticeId = null,}) {
  return _then(_ChatState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatStatus,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ChatItem>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isOffline: null == isOffline ? _self.isOffline : isOffline // ignore: cast_nullable_to_non_nullable
as bool,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,scrollToLatestTick: null == scrollToLatestTick ? _self.scrollToLatestTick : scrollToLatestTick // ignore: cast_nullable_to_non_nullable
as int,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as ChatNotice?,noticeId: null == noticeId ? _self.noticeId : noticeId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatNoticeCopyWith<$Res>? get notice {
    if (_self.notice == null) {
    return null;
  }

  return $ChatNoticeCopyWith<$Res>(_self.notice!, (value) {
    return _then(_self.copyWith(notice: value));
  });
}
}

// dart format on
