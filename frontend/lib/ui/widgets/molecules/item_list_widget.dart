import 'package:flutter/material.dart';
import 'package:fullstack_dev_test/ui/widgets/widgets.dart';

class ItemListWidget extends StatefulWidget {
  const ItemListWidget({
    required String title,
    super.key,
    String? subTitle,
    VoidCallback? onPressed,
  })  : _title = title,
        _subTitle = subTitle,
        _onPressed = onPressed;

  final String _title;
  final String? _subTitle;
  final VoidCallback? _onPressed;

  @override
  State<ItemListWidget> createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  bool _isHover = false;
  void Function(void Function())? _iconState;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (_) => _iconState?.call(() => _isHover = false),
      onEnter: (_) => _iconState?.call(() => _isHover = true),
      child: ListTile(
        onTap: widget._onPressed,
        contentPadding: const EdgeInsets.all(8),
        hoverColor: Colors.grey.shade100.withOpacity(0.8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        trailing: StatefulBuilder(
          builder: (context, state) {
            _iconState = state;
            return IconArrowRight(
                color: _isHover ? Colors.black54 : Colors.grey[400]);
          },
        ),
        title: TextWidget(
          text: widget._title,
          styleFunction: (textTheme) => textTheme.bodyMedium,
        ),
        subtitle: widget._subTitle == null
            ? null
            : TextWidget(
                text: widget._subTitle!,
                styleFunction: (textTheme) {
                  final bodySmall = textTheme.bodySmall;
                  return bodySmall?.copyWith(
                      color: bodySmall.color?.withOpacity(0.5));
                },
              ),
      ),
    );
  }
}
