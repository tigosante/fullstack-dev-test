import 'package:flutter/material.dart';
import 'package:fullstack_dev_test/ui/widgets/widgets.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({
    super.key,
    required String title,
    String? subTitle,
    VoidCallback? onPressed,
  })  : _title = title,
        _subTitle = subTitle,
        _onPressed = onPressed;

  final String _title;
  final String? _subTitle;
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _onPressed,
      trailing: const IconArrowRight(),
      contentPadding: const EdgeInsets.all(8),
      title: TextWidget(
        text: _title,
        styleFunction: (textTheme) => textTheme.bodyMedium,
      ),
      subtitle: _subTitle == null
          ? null
          : TextWidget(
              text: _subTitle,
              styleFunction: (textTheme) {
                final bodySmall = textTheme.bodySmall;
                return bodySmall?.copyWith(
                  color: bodySmall.color?.withOpacity(0.5),
                );
              }),
    );
  }
}
