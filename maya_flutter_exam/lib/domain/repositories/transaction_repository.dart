import 'package:maya_flutter_exam/data/models/send_money_model/send_money_model.dart';
import 'package:maya_flutter_exam/data/models/transaction_list_model/transaction_list_model.dart';

abstract class TransactionRepository {
  Future<SendMoneyModel> sendMoney(double amount);
  Future<List<TransactionListModel>> getTransactions();
}
