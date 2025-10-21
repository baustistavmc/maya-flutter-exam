import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:maya_flutter_exam/data/models/send_money_model/send_money_model.dart';
import 'package:maya_flutter_exam/domain/use_cases/send_money.dart';
import 'package:maya_flutter_exam/presentation/cubits/send_money_cubit/send_money_cubit.dart';
import 'package:maya_flutter_exam/presentation/cubits/send_money_cubit/send_money_state.dart';

class MockSendMoneyUseCase extends Mock implements SendMoneyUseCase {}

void main() {
  late MockSendMoneyUseCase mockUseCase;
  late SendMoneyCubit cubit;

  setUp(() {
    mockUseCase = MockSendMoneyUseCase();
    cubit = SendMoneyCubit(mockUseCase);
  });

  tearDown(() {
    cubit.close();
  });

  test('initial state should be SendMoneyStateInitial', () {
    expect(cubit.state, SendMoneyStateInitial());
  });

  blocTest<SendMoneyCubit, SendMoneyState>(
    'emits [loading, success] when send money succeeds',
    build: () {
      when(
        () => mockUseCase.sendMoneyUseCase(100),
      ).thenAnswer((_) async => SendMoneyModel(amount: 100));
      return cubit;
    },
    act: (cubit) => cubit.send(100.0),
    expect: () => [SendMoneyStateLoading(), SendMoneyStateSuccess()],
  );

  blocTest<SendMoneyCubit, SendMoneyState>(
    'emits [loading, error] when send money fails',
    build: () {
      when(
        () => mockUseCase.sendMoneyUseCase(100),
      ).thenThrow(Exception('Failed'));
      return cubit;
    },
    act: (cubit) => cubit.send(100.0),
    expect: () => [
      SendMoneyStateLoading(),
      SendMoneyStateError('Exception: Failed'),
    ],
  );
}
