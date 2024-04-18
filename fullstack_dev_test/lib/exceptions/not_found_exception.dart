import 'package:fullstack_dev_test/exceptions/exceptions.dart';

/// NotFoundException
///
/// codeSuffix = not_found_$codeSuffix
class NotFoundException extends BaseException {
  NotFoundException({String? codeSuffix})
      : super(code: 'not_found${codeSuffix != null ? '_$codeSuffix' : ''}');
}
