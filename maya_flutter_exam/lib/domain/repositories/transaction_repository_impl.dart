import 'package:maya_flutter_exam/data/data_resources/transaction_data_resource.dart';
import 'package:maya_flutter_exam/data/entities/transaction.dart';

import 'package:maya_flutter_exam/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource remoteDataSource;

  TransactionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Transaction> sendMoney(double amount) async {
    final model = await remoteDataSource.sendMoney(amount);
    return model;
  }
}
