import 'package:fullstack_dev_test/domain/entities/entities.dart';

class CountryDTO extends CountryEntity {
  CountryDTO({
    required String name,
  }) : super(name: name.trim());
}
