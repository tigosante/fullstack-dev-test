import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      indent: 10,
      endIndent: 10,
      color: Colors.grey.shade200,
    );
  }
}
