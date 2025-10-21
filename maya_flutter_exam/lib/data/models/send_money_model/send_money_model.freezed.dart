// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_money_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SendMoneyModel {

 double get amount;
/// Create a copy of SendMoneyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMoneyModelCopyWith<SendMoneyModel> get copyWith => _$SendMoneyModelCopyWithImpl<SendMoneyModel>(this as SendMoneyModel, _$identity);

  /// Serializes this SendMoneyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMoneyModel&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'SendMoneyModel(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $SendMoneyModelCopyWith<$Res>  {
  factory $SendMoneyModelCopyWith(SendMoneyModel value, $Res Function(SendMoneyModel) _then) = _$SendMoneyModelCopyWithImpl;
@useResult
$Res call({
 double amount
});




}
/// @nodoc
class _$SendMoneyModelCopyWithImpl<$Res>
    implements $SendMoneyModelCopyWith<$Res> {
  _$SendMoneyModelCopyWithImpl(this._self, this._then);

  final SendMoneyModel _self;
  final $Res Function(SendMoneyModel) _then;

/// Create a copy of SendMoneyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SendMoneyModel].
extension SendMoneyModelPatterns on SendMoneyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendMoneyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendMoneyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendMoneyModel value)  $default,){
final _that = this;
switch (_that) {
case _SendMoneyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendMoneyModel value)?  $default,){
final _that = this;
switch (_that) {
case _SendMoneyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendMoneyModel() when $default != null:
return $default(_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount)  $default,) {final _that = this;
switch (_that) {
case _SendMoneyModel():
return $default(_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount)?  $default,) {final _that = this;
switch (_that) {
case _SendMoneyModel() when $default != null:
return $default(_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendMoneyModel implements SendMoneyModel {
  const _SendMoneyModel({required this.amount});
  factory _SendMoneyModel.fromJson(Map<String, dynamic> json) => _$SendMoneyModelFromJson(json);

@override final  double amount;

/// Create a copy of SendMoneyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMoneyModelCopyWith<_SendMoneyModel> get copyWith => __$SendMoneyModelCopyWithImpl<_SendMoneyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendMoneyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMoneyModel&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'SendMoneyModel(amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$SendMoneyModelCopyWith<$Res> implements $SendMoneyModelCopyWith<$Res> {
  factory _$SendMoneyModelCopyWith(_SendMoneyModel value, $Res Function(_SendMoneyModel) _then) = __$SendMoneyModelCopyWithImpl;
@override @useResult
$Res call({
 double amount
});




}
/// @nodoc
class __$SendMoneyModelCopyWithImpl<$Res>
    implements _$SendMoneyModelCopyWith<$Res> {
  __$SendMoneyModelCopyWithImpl(this._self, this._then);

  final _SendMoneyModel _self;
  final $Res Function(_SendMoneyModel) _then;

/// Create a copy of SendMoneyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(_SendMoneyModel(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
