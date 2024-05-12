import 'package:fullstack_dev_test/ui/pages/cities/cities_controller.dart';
import 'package:fullstack_dev_test/ui/pages/pages.dart';
import 'package:go_router/go_router.dart' show GoRoute;
import 'package:fullstack_dev_test/router/router.dart';

class CitiesRoute extends BaseRoute {
  CitiesRoute({required super.injector});

  @override
  GoRoute route() {
    return GoRoute(
      path: AppRouterEnum.cities.path,
      redirect: (_, __) async {
        injector.setInstance<CitiesController>(
          () => CitiesControllerImpl(router: injector.get()),
        );
        return null;
      },
      builder: (_, state) {
        final countryName = state.params['country_name'];
        if (countryName == null) {
          throw Exception('Country name is required');
        }

        return CitiesPage(
          countryName: countryName,
          controller: injector.get(),
          getCitiesUsecase: injector.get(),
        );
      },
      routes: [CityDetailsRoute(injector: injector).route()],
    );
  }
}
