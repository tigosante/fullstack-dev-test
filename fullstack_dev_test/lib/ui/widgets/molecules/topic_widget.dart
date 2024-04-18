import 'package:flutter/material.dart';
import 'package:fullstack_dev_test/ui/widgets/widgets.dart' show TextWidget;

class TopicWidget extends StatelessWidget {
  const TopicWidget({
    super.key,
    required String title,
    required String description,
  })  : _title = title,
        _description = description;

  final String _title;
  final String _description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: _title,
          styleFunction: (textTheme) =>
              textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextWidget(
          text: _description,
          styleFunction: (textTheme) => textTheme.bodyMedium,
        ),
      ],
    );
  }
}
