import 'package:maya_flutter_exam/data/models/transaction_list_model/transaction_list_model.dart';
import 'package:maya_flutter_exam/domain/repositories/transaction_repository.dart';

class GetTransactionListUseCase {
  final TransactionRepository repository;

  GetTransactionListUseCase(this.repository);

  Future<List<TransactionListModel>> getTransactions() async {
    return await repository.getTransactions();
  }
}
