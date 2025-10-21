String? validateAmount(String? value) {
  if (value == null || value.trim().isEmpty) return 'Enter an amount';

  // Disallow multiple dots
  if ('..'.allMatches(value).isNotEmpty) return 'Invalid number';

  // Accept digits and at most one decimal point. Up to 2 decimals.
  final regex = RegExp(r'^\d+(?:\.\d{1,2})?$');
  if (!regex.hasMatch(value)) return 'Enter a valid amount (e.g. 100 or 12.34)';

  final parsed = double.tryParse(value);
  if (parsed == null || parsed <= 0) return 'Amount must be greater than 0';

  return null;
}

String? validateNonEmpty(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'This field cannot be empty';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Enter an email address';
  }

  final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!regex.hasMatch(value)) {
    return 'Enter a valid email address';
  }

  return null;
}
