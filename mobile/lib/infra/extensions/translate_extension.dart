import 'package:fullstack_dev_test/infra/infra.dart' show TranslateService;

TranslateService? _translateService;

extension TranslateExtenion on String {
  String translate() {
    return _translateService?.translate(this) ?? this;
  }
}

extension TranslateServiceExtenion on TranslateService {
  void setInstance() {
    _translateService = this;
  }
}
