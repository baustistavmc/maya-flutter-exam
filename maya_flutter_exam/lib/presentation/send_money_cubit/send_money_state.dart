import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_money_state.freezed.dart';

@freezed
class SendMoneyState with _$SendMoneyState {
  factory SendMoneyState.initial() = SendMoneyStateInitial;
  factory SendMoneyState.loading() = SendMoneyStateLoading;
  factory SendMoneyState.error([String? message]) = SendMoneyStateError;
  factory SendMoneyState.success() = SendMoneyStateSuccess;
}
