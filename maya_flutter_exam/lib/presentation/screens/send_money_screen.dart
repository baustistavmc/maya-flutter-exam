import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_flutter_exam/presentation/cubits/send_money_cubit/send_money_cubit.dart';
import 'package:maya_flutter_exam/presentation/cubits/send_money_cubit/send_money_state.dart';
import 'package:maya_flutter_exam/utils/input_formatters.dart';
import 'package:maya_flutter_exam/utils/validators.dart';
import 'package:maya_flutter_exam/widgets/drawer_widget.dart';
import 'package:maya_flutter_exam/widgets/loading_overlay.dart';
import 'package:maya_flutter_exam/widgets/transaction_result_dialog.dart';
import 'package:maya_flutter_exam/config/constants.dart' as color_constants;

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_onAmountChanged);
  }

  @override
  void dispose() {
    _amountController.removeListener(_onAmountChanged);
    _amountController.dispose();
    super.dispose();
  }

  void _onAmountChanged() {
    final text = _amountController.text.trim();
    final valid = validateAmount(text) == null;
    if (valid != _isValid) {
      setState(() => _isValid = valid);
    }
  }

  void _onSendPressed() {
    // Final validation
    if (!_formKey.currentState!.validate()) return;

    final amount = double.parse(_amountController.text.trim());
    context.read<SendMoneyCubit>().send(amount);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendMoneyCubit, SendMoneyState>(
      listener: (context, state) async {
        if (state is SendMoneyStateSuccess) {
          // ================ Show Transaction Result Dialog ================ //
          await transactionResultDialog(
            context: context,
            screenSize: MediaQuery.of(context).size,
            isSuccess: true,
            message: 'Your transaction was successful!',
            onOkay: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          );
          _amountController.clear();
        } else if (state is SendMoneyStateError) {
          await transactionResultDialog(
            context: context,
            screenSize: MediaQuery.of(context).size,
            isSuccess: false,
            message: state.message ?? 'Transaction failed. Please try again.',
            onOkay: () => Navigator.of(context).pop(),
          );
        }
      },
      builder: (BuildContext context, SendMoneyState state) {
        final isLoading = state is SendMoneyStateLoading;

        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text('Send Money'),
                centerTitle: true,
              ),
              endDrawer: DrawerWidget(),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 24),
                      // ================ Amount Display ================ //
                      Center(
                        child: Text(
                          '₱${(() {
                            final text = _amountController.text.trim();
                            final parsed = double.tryParse(text);
                            if (parsed == null || parsed <= 0) return '0.00';
                            return parsed.toStringAsFixed(2);
                          })()}',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 48,
                                color: color_constants.mainText,
                              ),
                        ),
                      ),

                      const SizedBox(height: 32),
                      // ================ Amount Input Field ================ //
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _amountController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9.]'),
                            ),
                            SingleDecimalPointFormatter(),
                          ],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Amount',
                            prefixText: '₱ ',
                            hintText: 'Enter amount',
                          ),
                          validator: validateAmount,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.done,
                          onChanged: (_) => setState(() {}),
                          onFieldSubmitted: (_) {
                            if (_isValid) _onSendPressed();
                          },
                        ),
                      ),

                      const SizedBox(height: 24),

                      // ================ Send Button ================ //
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                              _isValid
                                  ? color_constants.primary
                                  : color_constants.secondary,
                            ),
                            shape:
                                WidgetStateProperty.resolveWith<
                                  RoundedRectangleBorder
                                >(
                                  (_) => RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                          ),
                          onPressed: _isValid ? _onSendPressed : null,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 14.0),
                            child: Text(
                              'Send',
                              style: TextStyle(
                                fontSize: 16,
                                color: color_constants.background,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ================ Loading State ================ //
            if (isLoading) const LoadingOverlay(),
          ],
        );
      },
    );
  }
}
