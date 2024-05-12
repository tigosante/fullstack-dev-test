import 'package:flutter/material.dart';
import 'package:fullstack_dev_test/infra/infra.dart' show AppInjector;
import 'package:fullstack_dev_test/router/router.dart' show AppRouter;
import 'package:fullstack_dev_test/ui/widgets/widgets.dart'
    show TranslateInheritedWidget;

class Application extends StatelessWidget {
  const Application({
    super.key,
    required AppInjector injector,
  }) : _injector = injector;

  final AppInjector _injector;

  @override
  Widget build(BuildContext context) {
    return TranslateInheritedWidget(
      translateService: _injector.get(),
      child: MaterialApp.router(
        routerConfig: _injector.get<AppRouter>().routerConfig,
      ),
    );
  }
}
