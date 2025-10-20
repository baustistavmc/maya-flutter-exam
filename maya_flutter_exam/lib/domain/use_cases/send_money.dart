import 'package:maya_flutter_exam/data/entities/transaction.dart';

import '../repositories/transaction_repository.dart';

class SendMoneyUseCase {
  final TransactionRepository repository;

  SendMoneyUseCase(this.repository);

  Future<Transaction> sendMoneyUseCase(double amount) async {
    if (amount <= 0) {
      throw Exception('Amount must be greater than zero');
    }

    return await repository.sendMoney(amount);
  }
}
