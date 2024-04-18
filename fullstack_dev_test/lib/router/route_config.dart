import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:fullstack_dev_test/infra/infra.dart';
import 'package:fullstack_dev_test/ui/pages/pages.dart';
import 'package:go_router/go_router.dart' show GoRouter;
import 'package:fullstack_dev_test/router/router.dart';

Future<void> routesConfig(AppInjector injector) async {
  final provider = GoRouter(
    debugLogDiagnostics: !kReleaseMode,
    initialLocation: AppRouterEnum.counties.path,
    routes: [
      CountriesRoute(injector: injector).route(),
    ],
    errorBuilder: (_, state) => const NotFoundPage(),
  );

  injector.get<AppRouter>().setProvider(provider);
}
