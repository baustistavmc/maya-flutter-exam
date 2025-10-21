// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionListModel {

 String get id; double get amount; String get transactionType;// "send" or "received"
 DateTime get date;
/// Create a copy of TransactionListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionListModelCopyWith<TransactionListModel> get copyWith => _$TransactionListModelCopyWithImpl<TransactionListModel>(this as TransactionListModel, _$identity);

  /// Serializes this TransactionListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionListModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,transactionType,date);

@override
String toString() {
  return 'TransactionListModel(id: $id, amount: $amount, transactionType: $transactionType, date: $date)';
}


}

/// @nodoc
abstract mixin class $TransactionListModelCopyWith<$Res>  {
  factory $TransactionListModelCopyWith(TransactionListModel value, $Res Function(TransactionListModel) _then) = _$TransactionListModelCopyWithImpl;
@useResult
$Res call({
 String id, double amount, String transactionType, DateTime date
});




}
/// @nodoc
class _$TransactionListModelCopyWithImpl<$Res>
    implements $TransactionListModelCopyWith<$Res> {
  _$TransactionListModelCopyWithImpl(this._self, this._then);

  final TransactionListModel _self;
  final $Res Function(TransactionListModel) _then;

/// Create a copy of TransactionListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,Object? transactionType = null,Object? date = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionListModel].
extension TransactionListModelPatterns on TransactionListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionListModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionListModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double amount,  String transactionType,  DateTime date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionListModel() when $default != null:
return $default(_that.id,_that.amount,_that.transactionType,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double amount,  String transactionType,  DateTime date)  $default,) {final _that = this;
switch (_that) {
case _TransactionListModel():
return $default(_that.id,_that.amount,_that.transactionType,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double amount,  String transactionType,  DateTime date)?  $default,) {final _that = this;
switch (_that) {
case _TransactionListModel() when $default != null:
return $default(_that.id,_that.amount,_that.transactionType,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionListModel implements TransactionListModel {
  const _TransactionListModel({required this.id, required this.amount, required this.transactionType, required this.date});
  factory _TransactionListModel.fromJson(Map<String, dynamic> json) => _$TransactionListModelFromJson(json);

@override final  String id;
@override final  double amount;
@override final  String transactionType;
// "send" or "received"
@override final  DateTime date;

/// Create a copy of TransactionListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionListModelCopyWith<_TransactionListModel> get copyWith => __$TransactionListModelCopyWithImpl<_TransactionListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionListModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionListModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,transactionType,date);

@override
String toString() {
  return 'TransactionListModel(id: $id, amount: $amount, transactionType: $transactionType, date: $date)';
}


}

/// @nodoc
abstract mixin class _$TransactionListModelCopyWith<$Res> implements $TransactionListModelCopyWith<$Res> {
  factory _$TransactionListModelCopyWith(_TransactionListModel value, $Res Function(_TransactionListModel) _then) = __$TransactionListModelCopyWithImpl;
@override @useResult
$Res call({
 String id, double amount, String transactionType, DateTime date
});




}
/// @nodoc
class __$TransactionListModelCopyWithImpl<$Res>
    implements _$TransactionListModelCopyWith<$Res> {
  __$TransactionListModelCopyWithImpl(this._self, this._then);

  final _TransactionListModel _self;
  final $Res Function(_TransactionListModel) _then;

/// Create a copy of TransactionListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,Object? transactionType = null,Object? date = null,}) {
  return _then(_TransactionListModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
