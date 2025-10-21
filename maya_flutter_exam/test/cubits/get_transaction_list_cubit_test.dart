import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maya_flutter_exam/data/models/transaction_list_model/transaction_list_model.dart';
import 'package:maya_flutter_exam/domain/use_cases/get_transaction_list.dart';
import 'package:maya_flutter_exam/presentation/cubits/get_transaction_list_cubit/get_transaction_list_cubit.dart';
import 'package:maya_flutter_exam/presentation/cubits/get_transaction_list_cubit/get_transaction_list_state.dart';
import 'package:mocktail/mocktail.dart';

class MockGetTransactionListUseCase extends Mock
    implements GetTransactionListUseCase {}

void main() {
  late MockGetTransactionListUseCase mockUseCase;
  late TransactionListCubit cubit;

  setUp(() {
    mockUseCase = MockGetTransactionListUseCase();
    cubit = TransactionListCubit(useCase: mockUseCase);
  });

  tearDown(() {
    cubit.close();
  });

  test('initial state should be TransactionListState.initial', () {
    expect(cubit.state, const TransactionListState.initial());
  });

  blocTest<TransactionListCubit, TransactionListState>(
    'emits [loading, loaded] when getTransactions succeeds',
    build: () => cubit,
    setUp: () {
      final transaction = TransactionListModel(
        id: '1',
        amount: 100.0,
        transactionType: 'send',
        date: DateTime(2025, 10, 21),
      );

      when(
        () => mockUseCase.getTransactions(),
      ).thenAnswer((_) async => [transaction]);
    },
    act: (cubit) => cubit.fetchTransactions(),
    expect: () => [
      const TransactionListState.loading(),
      TransactionListState.loaded([
        TransactionListModel(
          id: '1',
          amount: 100.0,
          transactionType: 'send',
          date: DateTime(2025, 10, 21),
        ),
      ]),
    ],
  );

  blocTest<TransactionListCubit, TransactionListState>(
    'emits [loading, error] when getTransactions fails',
    build: () => cubit,
    setUp: () {
      when(() => mockUseCase.getTransactions()).thenThrow(Exception('Failed'));
    },
    act: (cubit) => cubit.fetchTransactions(),
    expect: () => [
      const TransactionListState.loading(),
      const TransactionListState.error('Exception: Failed'),
    ],
  );
}
