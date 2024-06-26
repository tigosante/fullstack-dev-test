import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:fullstack_dev_test/infra/infra.dart';
import 'package:fullstack_dev_test/router/router.dart';
import 'package:fullstack_dev_test/ui/pages/pages.dart';
import 'package:go_router/go_router.dart' show GoRouter;

Future<void> routesConfig(AppInjector injector) async {
  final provider = GoRouter(
    debugLogDiagnostics: !kReleaseMode,
    initialLocation: AppRouterEnum.counties.path,
    routes: [
      CountriesRoute(injector: injector).route(),
    ],
    errorBuilder: (_, state) => NotFoundPage(appRouter: injector.get()),
  );

  injector.get<AppRouter>().setProvider(provider);
}
