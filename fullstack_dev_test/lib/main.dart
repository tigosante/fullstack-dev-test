import 'package:flutter/material.dart' show runApp;
import 'package:fullstack_dev_test/application.dart' show Application;
import 'package:fullstack_dev_test/infra/infra.dart' show startAppService;

Future<void> main() async {
  final injector = await startAppService();
  runApp(Application(injector: injector));
}
