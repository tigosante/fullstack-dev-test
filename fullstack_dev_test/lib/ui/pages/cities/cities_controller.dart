import 'package:fullstack_dev_test/router/app_router.dart';
import 'package:fullstack_dev_test/router/app_router_enum.dart';

mixin CitiesController {
  void nextPage({required String cityName, required String subcountry});
}

class CitiesControllerImpl implements CitiesController {
  CitiesControllerImpl({
    required AppRouter router,
  }) : _router = router;

  final AppRouter _router;

  @override
  void nextPage({required String cityName, required String subcountry}) {
    _router.go(AppRouterEnum.cityDetails, params: {
      'city_name': cityName,
      'subcountry': subcountry,
    });
  }
}
