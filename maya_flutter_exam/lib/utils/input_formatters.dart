import 'package:flutter/services.dart';

class SingleDecimalPointFormatter extends TextInputFormatter {
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
