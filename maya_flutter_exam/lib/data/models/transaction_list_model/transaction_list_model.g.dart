// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionListModel _$TransactionListModelFromJson(
  Map<String, dynamic> json,
) => _TransactionListModel(
  id: json['id'] as String,
  amount: (json['amount'] as num).toDouble(),
  transactionType: json['transactionType'] as String,
  date: DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$TransactionListModelToJson(
  _TransactionListModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.amount,
  'transactionType': instance.transactionType,
  'date': instance.date.toIso8601String(),
};
