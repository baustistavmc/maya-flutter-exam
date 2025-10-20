import 'package:maya_flutter_exam/data/entities/transaction.dart';

abstract class TransactionRepository {
  Future<Transaction> sendMoney(double amount);
}
