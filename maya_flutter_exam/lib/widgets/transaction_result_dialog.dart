import 'package:flutter/material.dart';
import 'package:maya_flutter_exam/config/constants.dart' as color_constants;

Future<void> transactionResultDialog({
  required BuildContext context,
  required Size screenSize,
  required String message,
  required void Function() onOkay,
  bool isSuccess = true,
}) {
  final Color iconColor = isSuccess
      ? color_constants.primary
      : color_constants.tertiary;
  final IconData icon = isSuccess
      ? Icons.check_circle_rounded
      : Icons.error_rounded;

  return showModalBottomSheet(
    enableDrag: false,
    isDismissible: false,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: color_constants.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          constraints: BoxConstraints(maxHeight: screenSize.height * .48),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: iconColor, size: 72),
              const SizedBox(height: 16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: iconColor,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(iconColor),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: onOkay,
                  child: const Text(
                    'Okay',
                    style: TextStyle(
                      fontSize: 16,
                      color: color_constants.background,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
