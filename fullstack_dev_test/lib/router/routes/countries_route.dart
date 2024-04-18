import 'package:go_router/go_router.dart' show GoRoute;
import 'package:fullstack_dev_test/router/router.dart';
import 'package:fullstack_dev_test/ui/pages/country/country_controller.dart';
import 'package:fullstack_dev_test/ui/pages/country/country_page.dart';

class CountriesRoute extends BaseRoute {
  CountriesRoute({required super.injector});

  @override
  GoRoute route() {
    return GoRoute(
      path: AppRouterEnum.counties.path,
      redirect: (_, __) async {
        injector.setInstance<CountryController>(
          () => CountryControllerImpl(router: injector.get()),
        );
        return null;
      },
      builder: (_, state) => CountryPage(
        controller: injector.get(),
        getContriesUsecase: injector.get(),
      ),
      routes: [
        CitiesRoute(injector: injector).route(),
      ],
    );
  }
}
