import 'package:fullstack_dev_test/exceptions/exceptions.dart';

class PlatformException extends BaseException {
  PlatformException() : super(code: 'platform_error');
}
