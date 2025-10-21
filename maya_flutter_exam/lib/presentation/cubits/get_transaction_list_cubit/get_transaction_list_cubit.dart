import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_flutter_exam/data/models/transaction_list_model/transaction_list_model.dart';
import 'package:maya_flutter_exam/domain/use_cases/get_transaction_list.dart';
import 'package:maya_flutter_exam/presentation/cubits/get_transaction_list_cubit/get_transaction_list_state.dart';

class TransactionListCubit extends Cubit<TransactionListState> {
  final GetTransactionListUseCase useCase;

  TransactionListCubit({required this.useCase})
    : super(const TransactionListState.initial());

  Future<void> fetchTransactions() async {
    emit(const TransactionListState.loading());
    try {
      final List<TransactionListModel> transactions = await useCase
          .getTransactions();
      emit(TransactionListState.loaded(transactions));
    } catch (e) {
      emit(TransactionListState.error(e.toString()));
    }
  }
}
