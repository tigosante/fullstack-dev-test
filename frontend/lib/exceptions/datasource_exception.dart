import 'package:fullstack_dev_test/exceptions/exceptions.dart';

class DatasourceException extends BaseException {
  DatasourceException({required String clientName})
      : super(code: 'datasource_error', message: clientName);
}
