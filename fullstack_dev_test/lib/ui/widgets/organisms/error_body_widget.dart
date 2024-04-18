import 'package:flutter/material.dart';
import 'package:fullstack_dev_test/ui/widgets/widgets.dart';

class ErrorBodyWidget extends StatelessWidget {
  const ErrorBodyWidget({
    super.key,
    required String message,
    required VoidCallback onRetry,
  })  : _message = message,
        _onRetry = onRetry;

  final String _message;
  final VoidCallback _onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            text: _message,
            styleFunction: (textTheme) =>
                textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: _onRetry,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.teal.shade700),
            ),
            child: TextWidget(
              text: 'Retry',
              styleFunction: (textTheme) => textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
