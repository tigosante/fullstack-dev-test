import 'package:flutter/material.dart';
import 'package:fullstack_dev_test/infra/infra.dart'
    show TranslateService, TranslateServiceExtenion;

class TranslateInheritedWidget extends InheritedWidget {
  const TranslateInheritedWidget({
    super.key,
    required super.child,
    required this.translateService,
  });

  final TranslateService translateService;

  @override
  bool updateShouldNotify(TranslateInheritedWidget oldWidget) {
    final shouldNotify = translateService != oldWidget.translateService;
    if (shouldNotify) {
      translateService.setInstance();
    }
    return shouldNotify;
  }

  static TranslateService of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TranslateInheritedWidget>()!
        .translateService;
  }
}
