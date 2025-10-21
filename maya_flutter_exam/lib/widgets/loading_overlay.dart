import 'package:flutter/material.dart';
import 'package:maya_flutter_exam/config/constants.dart' as color_constants;

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.6,
          child: ModalBarrier(dismissible: false, color: Colors.grey),
        ),

        const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(color_constants.primary),
          ),
        ),
      ],
    );
  }
}
