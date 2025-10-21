import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'send_money_model.freezed.dart';
part 'send_money_model.g.dart';

SendMoneyModel sendMoneyModelFromJson(String str) =>
    SendMoneyModel.fromJson(json.decode(str));

String sendMoneyModelToJson(SendMoneyModel data) => json.encode(data.toJson());

@freezed
abstract class SendMoneyModel with _$SendMoneyModel {
  const factory SendMoneyModel({required double amount}) = _SendMoneyModel;

  factory SendMoneyModel.fromJson(Map<String, dynamic> json) =>
      _$SendMoneyModelFromJson(json);
}
