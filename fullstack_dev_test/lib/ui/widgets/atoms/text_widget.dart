import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required String text,
    TextStyle? Function(TextTheme textTheme)? styleFunction,
  })  : _text = text,
        _styleFunction = styleFunction;

  final String _text;
  final TextStyle? Function(TextTheme textTheme)? _styleFunction;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      softWrap: true,
      textAlign: TextAlign.left,
      style: _styleFunction?.call(Theme.of(context).textTheme),
    );
  }
}
