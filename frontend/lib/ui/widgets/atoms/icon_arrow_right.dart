import 'package:flutter/material.dart';

class IconArrowRight extends StatelessWidget {
  const IconArrowRight({super.key, Color? color}) : _color = color;

  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.keyboard_arrow_right_rounded,
      color: _color,
    );
  }
}
