import 'package:maya_flutter_exam/data/data_resources/transaction_data_resource.dart';
import 'package:maya_flutter_exam/data/models/send_money_model/send_money_model.dart';
import 'package:maya_flutter_exam/data/models/transaction_list_model/transaction_list_model.dart';

import 'package:maya_flutter_exam/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource remoteDataSource;

  TransactionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SendMoneyModel> sendMoney(double amount) async {
    final model = await remoteDataSource.sendMoney(amount);
    return model;
  }

  @override
  Future<List<TransactionListModel>> getTransactions() async {
    try {
      final transactions = await remoteDataSource.getTransactions();
      return transactions;
    } catch (e) {
      throw Exception('Failed to fetch transactions: $e');
    }
  }
}
