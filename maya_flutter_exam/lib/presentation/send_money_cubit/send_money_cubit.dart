import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_flutter_exam/domain/use_cases/send_money.dart';
import 'package:maya_flutter_exam/presentation/send_money_cubit/send_money_state.dart';

class SendMoneyCubit extends Cubit<SendMoneyState> {
  final SendMoneyUseCase useCase;

  SendMoneyCubit(this.useCase) : super(SendMoneyStateInitial());

  Future<void> send(double amount) async {
    emit(SendMoneyStateLoading());
    try {
      await useCase.sendMoneyUseCase(amount);
      emit(SendMoneyStateSuccess());
    } catch (e) {
      emit(SendMoneyStateError(e.toString()));
    }
  }
}
