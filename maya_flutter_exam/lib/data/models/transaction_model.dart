import 'package:maya_flutter_exam/data/entities/transaction.dart';

class TransactionModel extends Transaction {
  TransactionModel({required super.amount});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(amount: (json['amount'] ?? 0).toDouble());
  }

  Map<String, dynamic> toJson() {
    return {'amount': amount};
  }
}
