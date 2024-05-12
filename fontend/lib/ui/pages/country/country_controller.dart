import 'package:fullstack_dev_test/router/router.dart';

mixin CountryController {
  void nextPage(String countryName);
}

class CountryControllerImpl implements CountryController {
  CountryControllerImpl({required AppRouter router}) : _router = router;

  final AppRouter _router;

  @override
  void nextPage(String countryName) {
    _router.go(AppRouterEnum.cities, params: {'country_name': countryName});
  }
}
