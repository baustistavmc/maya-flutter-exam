import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maya_flutter_exam/data/models/transaction_list_model/transaction_list_model.dart';

part 'get_transaction_list_state.freezed.dart';

@freezed
class TransactionListState with _$TransactionListState {
  const factory TransactionListState.initial() = _Initial;
  const factory TransactionListState.loading() = _Loading;
  const factory TransactionListState.loaded(
    List<TransactionListModel> transactions,
  ) = _Loaded;
  const factory TransactionListState.error(String message) = _Error;
}
