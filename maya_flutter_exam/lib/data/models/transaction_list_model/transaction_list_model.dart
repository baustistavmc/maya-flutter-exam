import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'transaction_list_model.freezed.dart';
part 'transaction_list_model.g.dart';

TransactionListModel transactionListModelFromJson(String str) =>
    TransactionListModel.fromJson(json.decode(str));

String transactionListModelToJson(TransactionListModel data) =>
    json.encode(data.toJson());

@freezed
abstract class TransactionListModel with _$TransactionListModel {
  const factory TransactionListModel({
    required String id,
    required double amount,
    required String transactionType, // "send" or "received"
    required DateTime date,
  }) = _TransactionListModel;

  factory TransactionListModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionListModelFromJson(json);
}
