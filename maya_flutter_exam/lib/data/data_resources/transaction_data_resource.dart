import 'package:dio/dio.dart';
import 'package:maya_flutter_exam/data/models/transaction_model.dart';

class TransactionRemoteDataSource {
  final Dio _dio;

  TransactionRemoteDataSource({Dio? dio}) : _dio = dio ?? Dio();

  Future<TransactionModel> sendMoney(double amount) async {
    try {
      final response = await _dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {'amount': amount},
      );

      return TransactionModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to send money: $e');
    }
  }

  Future<List<TransactionModel>> getTransactions() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/posts',
      );

      final data = response.data as List;
      return data.map((json) => TransactionModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch transactions: $e');
    }
  }
}
