import 'package:flutter/material.dart';
import 'package:fullstack_dev_test/ui/widgets/atoms/atoms.dart';

class AppBarWidget extends AppBar {
  AppBarWidget({
    super.key,
    required String title,
  }) : super(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: TextWidget(
            text: title,
            styleFunction: (textTheme) =>
                textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        );
}
