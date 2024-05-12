import 'package:fullstack_dev_test/infra/infra.dart' show AppInjector;
import 'package:go_router/go_router.dart' show GoRoute;

abstract class BaseRoute {
  BaseRoute({required this.injector});
  final AppInjector injector;
  GoRoute route();
}
