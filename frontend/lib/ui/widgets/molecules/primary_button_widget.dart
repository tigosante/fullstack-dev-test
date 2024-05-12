import 'package:flutter/material.dart';
import 'package:fullstack_dev_test/ui/widgets/widgets.dart' show TextWidget;

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key,
    required String title,
    VoidCallback? onPressed,
  })  : _title = title,
        _onPressed = onPressed;

  final String _title;
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
      ),
      child: TextWidget(
        text: _title,
        styleFunction: (textTheme) => textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
