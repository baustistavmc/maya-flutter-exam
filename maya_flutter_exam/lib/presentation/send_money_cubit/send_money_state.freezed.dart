// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_money_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SendMoneyState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMoneyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SendMoneyState()';
}


}

/// @nodoc
class $SendMoneyStateCopyWith<$Res>  {
$SendMoneyStateCopyWith(SendMoneyState _, $Res Function(SendMoneyState) __);
}


/// Adds pattern-matching-related methods to [SendMoneyState].
extension SendMoneyStatePatterns on SendMoneyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SendMoneyStateInitial value)?  initial,TResult Function( SendMoneyStateLoading value)?  loading,TResult Function( SendMoneyStateError value)?  error,TResult Function( SendMoneyStateSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SendMoneyStateInitial() when initial != null:
return initial(_that);case SendMoneyStateLoading() when loading != null:
return loading(_that);case SendMoneyStateError() when error != null:
return error(_that);case SendMoneyStateSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SendMoneyStateInitial value)  initial,required TResult Function( SendMoneyStateLoading value)  loading,required TResult Function( SendMoneyStateError value)  error,required TResult Function( SendMoneyStateSuccess value)  success,}){
final _that = this;
switch (_that) {
case SendMoneyStateInitial():
return initial(_that);case SendMoneyStateLoading():
return loading(_that);case SendMoneyStateError():
return error(_that);case SendMoneyStateSuccess():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SendMoneyStateInitial value)?  initial,TResult? Function( SendMoneyStateLoading value)?  loading,TResult? Function( SendMoneyStateError value)?  error,TResult? Function( SendMoneyStateSuccess value)?  success,}){
final _that = this;
switch (_that) {
case SendMoneyStateInitial() when initial != null:
return initial(_that);case SendMoneyStateLoading() when loading != null:
return loading(_that);case SendMoneyStateError() when error != null:
return error(_that);case SendMoneyStateSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String? message)?  error,TResult Function()?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SendMoneyStateInitial() when initial != null:
return initial();case SendMoneyStateLoading() when loading != null:
return loading();case SendMoneyStateError() when error != null:
return error(_that.message);case SendMoneyStateSuccess() when success != null:
return success();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String? message)  error,required TResult Function()  success,}) {final _that = this;
switch (_that) {
case SendMoneyStateInitial():
return initial();case SendMoneyStateLoading():
return loading();case SendMoneyStateError():
return error(_that.message);case SendMoneyStateSuccess():
return success();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String? message)?  error,TResult? Function()?  success,}) {final _that = this;
switch (_that) {
case SendMoneyStateInitial() when initial != null:
return initial();case SendMoneyStateLoading() when loading != null:
return loading();case SendMoneyStateError() when error != null:
return error(_that.message);case SendMoneyStateSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class SendMoneyStateInitial implements SendMoneyState {
   SendMoneyStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMoneyStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SendMoneyState.initial()';
}


}




/// @nodoc


class SendMoneyStateLoading implements SendMoneyState {
   SendMoneyStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMoneyStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SendMoneyState.loading()';
}


}




/// @nodoc


class SendMoneyStateError implements SendMoneyState {
   SendMoneyStateError([this.message]);
  

 final  String? message;

/// Create a copy of SendMoneyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMoneyStateErrorCopyWith<SendMoneyStateError> get copyWith => _$SendMoneyStateErrorCopyWithImpl<SendMoneyStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMoneyStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SendMoneyState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SendMoneyStateErrorCopyWith<$Res> implements $SendMoneyStateCopyWith<$Res> {
  factory $SendMoneyStateErrorCopyWith(SendMoneyStateError value, $Res Function(SendMoneyStateError) _then) = _$SendMoneyStateErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$SendMoneyStateErrorCopyWithImpl<$Res>
    implements $SendMoneyStateErrorCopyWith<$Res> {
  _$SendMoneyStateErrorCopyWithImpl(this._self, this._then);

  final SendMoneyStateError _self;
  final $Res Function(SendMoneyStateError) _then;

/// Create a copy of SendMoneyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(SendMoneyStateError(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SendMoneyStateSuccess implements SendMoneyState {
   SendMoneyStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMoneyStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SendMoneyState.success()';
}


}




// dart format on
