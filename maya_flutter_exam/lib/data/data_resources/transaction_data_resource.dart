import 'dart:math';

import 'package:dio/dio.dart';
import 'package:maya_flutter_exam/data/models/send_money_model/send_money_model.dart';
import 'package:maya_flutter_exam/data/models/transaction_list_model/transaction_list_model.dart';

class TransactionRemoteDataSource {
  final Dio _dio;

  TransactionRemoteDataSource({Dio? dio}) : _dio = dio ?? Dio();

  Future<SendMoneyModel> sendMoney(double amount) async {
    try {
      final response = await _dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {'amount': amount},
      );

      return SendMoneyModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to send money: $e');
    }
  }

  Future<List<TransactionListModel>> getTransactions() async {
    try {
      await _dio.get('https://jsonplaceholder.typicode.com/posts');

      final random = Random();
      return List.generate(15, (index) {
        return TransactionListModel(
          id: (index + 1).toString(),
          amount: (random.nextInt(9000) + 100) / 100, // 1.0 to 100.0
          transactionType: random.nextBool() ? 'send' : 'received',
          date: DateTime.now().subtract(Duration(days: index)),
        );
      });
    } catch (e) {
      throw Exception('Failed to fetch transactions: $e');
    }
  }
}
