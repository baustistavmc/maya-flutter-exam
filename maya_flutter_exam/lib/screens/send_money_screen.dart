import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_flutter_exam/presentation/send_money_cubit/send_money_cubit.dart';
import 'package:maya_flutter_exam/presentation/send_money_cubit/send_money_state.dart';
import 'package:maya_flutter_exam/widgets/drawer_widget.dart';
import 'package:maya_flutter_exam/widgets/success_transaction_dialog.dart';

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
    final valid = _validateAmount(text) == null;
    if (valid != _isValid) {
      setState(() => _isValid = valid);
    }
  }

  /// Validator: allows integers or decimals with up to 2 fractional digits.
  String? _validateAmount(String? value) {
    if (value == null || value.trim().isEmpty) return 'Enter an amount';

    // Disallow multiple dots
    if ('..'.allMatches(value).isNotEmpty) return 'Invalid number';

    // Accept digits and at most one decimal point. Up to 2 decimals.
    final regex = RegExp(r'^\d+(?:\.\d{1,2})?$');

    if (!regex.hasMatch(value)) {
      debugPrint('Value "$value" did not match regex');
      return 'Enter a valid amount (e.g. 100 or 12.34)';
    }

    // Optional: disallow zero
    final parsed = double.tryParse(value);
    if (parsed == null || parsed <= 0) return 'Amount must be greater than 0';

    return null;
  }

  void _onSendPressed() {
    // Final validation
    if (!_formKey.currentState!.validate()) return;

    final amount = double.parse(_amountController.text.trim());
    context.read<SendMoneyCubit>().send(amount);
    // context.read<SendMoneyCubit>().fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendMoneyCubit, SendMoneyState>(
      listener: (context, state) async {
        if (state is SendMoneyStateSuccess) {
          await transactionResultDialog(
            context: context,
            screenSize: MediaQuery.of(context).size,
            isSuccess: true,
            message: 'Your transaction was successful!',
          );

          _amountController.clear();
        } else if (state is SendMoneyStateError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message!)));
        }
      },
      builder: (BuildContext context, SendMoneyState state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Send Money'), centerTitle: true),
          endDrawer: DrawerWidget(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),

                  Center(
                    child: Text(
                      '₱${(() {
                        final text = _amountController.text.trim();
                        final parsed = double.tryParse(text);
                        if (parsed == null || parsed <= 0) return '0.00';
                        return parsed.toStringAsFixed(2);
                      })()}',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 48,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _amountController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                        _SingleDecimalPointFormatter(),
                      ],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Amount',
                        prefixText: '₱ ',
                        hintText: 'Enter amount',
                      ),
                      validator: _validateAmount,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        setState(() {});
                      },
                      onFieldSubmitted: (_) {
                        if (_isValid) _onSendPressed();
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          _isValid ? const Color(0xFF9FE8A5) : Colors.grey,
                        ),
                        shape:
                            WidgetStateProperty.resolveWith<
                              RoundedRectangleBorder
                            >((_) {
                              return RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              );
                            }),
                      ),
                      onPressed: _isValid ? _onSendPressed : null,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        child: Text('Send', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// InputFormatter
class _SingleDecimalPointFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text;

    // If new text contains more than one dot, reject it and return old value.
    if ('.'.allMatches(newText).length > 1) return oldValue;

    // Limit to 2 decimals if there is a decimal point
    if (newText.contains('.')) {
      final parts = newText.split('.');
      final fractional = parts.length > 1 ? parts[1] : '';
      if (fractional.length > 2) return oldValue;
    }

    return newValue;
  }
}
