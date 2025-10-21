import 'package:flutter/material.dart';
import 'package:maya_flutter_exam/data/models/transaction_list_model/transaction_list_model.dart';
import 'package:maya_flutter_exam/config/constants.dart' as color_constants;

class TransactionListView extends StatelessWidget {
  final List<TransactionListModel> transactions;

  const TransactionListView({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: transactions.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final tx = transactions[index];
        return TransactionListItem(tx: tx);
      },
    );
  }
}

class TransactionListItem extends StatelessWidget {
  final TransactionListModel tx;

  const TransactionListItem({super.key, required this.tx});

  @override
  Widget build(BuildContext context) {
    final isSend = tx.transactionType == 'send';

    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // ================ Date & Description ================ //
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tx.date.toLocal().toString().split(' ')[0],
                style: TextStyle(color: color_constants.subText),
              ),
              Text(
                isSend ? 'Send Money' : 'Receive Money',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: color_constants.mainText,
                ),
              ),
            ],
          ),
          // ================ Amount Text ================ //
          Text(
            '${isSend ? '-' : '+'}₱ ${tx.amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: color_constants.mainText,
            ),
          ),
        ],
      ),
    );
  }
}
