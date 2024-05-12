import 'package:flutter/material.dart' show RouterConfig;
import 'package:fullstack_dev_test/router/router.dart';
import 'package:go_router/go_router.dart' show GoRouter;

mixin AppRouter {
  RouterConfig<Object>? get routerConfig;

  void back();
  void reaplce(AppRouterEnum route);
  void go(AppRouterEnum route, {Map<String, dynamic> params = const {}});

  void setProvider(GoRouter provider);
}

class AppRouterImpl implements AppRouter {
  static late GoRouter _provider;

  @override
  RouterConfig<Object>? get routerConfig => _provider;

  @override
  void setProvider(GoRouter provider) => _provider = provider;

  @override
  void back() {
    _provider.pop();
  }

  @override
  void reaplce(AppRouterEnum route) {
    _provider.replace(route.path);
  }

  @override
  void go(AppRouterEnum route, {Map<String, dynamic> params = const {}}) {
    var routeFix = '${_provider.location}/${_fixRoutePath(route, params)}';
    _provider.push(routeFix);
  }

  String _fixRoutePath(AppRouterEnum route, Map<String, dynamic> params) {
    if (route.path.contains(':') && params.isNotEmpty) {
      return route.path.replaceAllMapped(RegExp(r':\w+'), (match) {
        var key = match.group(0)?.replaceAll(':', '');
        return params[key].toString();
      });
    }
    return route.path;
  }
}
