const _countiesPath = '/counties';

enum AppRouterEnum {
  home(path: _countiesPath),
  counties(path: _countiesPath),
  cities(
    path: ':country_name/cities',
    params: {'country_name': String},
  ),
  cityDetails(
    path: ':subcountry/:city_name/details',
    params: {'city_name': String},
  );

  final String path;
  final Map<String, Type>? params;

  const AppRouterEnum({required this.path, this.params});
}
