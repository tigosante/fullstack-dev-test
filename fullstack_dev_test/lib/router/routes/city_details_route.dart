import 'package:fullstack_dev_test/router/router.dart';
import 'package:fullstack_dev_test/ui/pages/city_details_page.dart';
import 'package:go_router/go_router.dart' show GoRoute;

class CityDetailsRoute extends BaseRoute {
  CityDetailsRoute({required super.injector});

  @override
  GoRoute route() {
    return GoRoute(
      path: AppRouterEnum.cityDetails.path,
      builder: (_, state) {
        final cityName = state.params['city_name'];
        if (cityName == null) {
          throw Exception('City name is required');
        }
        final countryName = state.params['country_name'];
        if (countryName == null) {
          throw Exception('Country name is required');
        }
        final subCountryname = state.params['subcountry'];
        if (subCountryname == null) {
          throw Exception('Subcountry name is required');
        }
        return CityDetailsPage(
          cityName: cityName,
          countryname: countryName,
          subCountryname: subCountryname,
          getCityDeatilsUsecase: injector.get(),
        );
      },
    );
  }
}
