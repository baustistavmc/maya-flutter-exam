import 'package:flutter/material.dart';
import 'package:maya_flutter_exam/config/constants.dart' as color_constants;

class ErrorScreen extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorScreen({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 80,
              color: color_constants.tertiary,
            ),
            const SizedBox(height: 16),
            Text(
              'Something went wrong',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: color_constants.mainText,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: color_constants.subText),
            ),
            const SizedBox(height: 24),
            if (onRetry != null)
              ElevatedButton.icon(
                icon: const Icon(Icons.refresh, color: color_constants.primary),
                label: const Text(
                  'Try Again',
                  style: TextStyle(color: color_constants.primary),
                ),
                onPressed: onRetry,
              ),
          ],
        ),
      ),
    );
  }
}
