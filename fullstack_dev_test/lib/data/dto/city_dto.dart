import 'package:fullstack_dev_test/domain/entities/entities.dart';

class CityDTO extends CityEntity {
  CityDTO({
    required super.name,
    required super.subcountry,
  });

  factory CityDTO.fromJson(Map<String, dynamic> map) {
    return CityDTO(
      name: map['city'] as String,
      subcountry: map['subcountry'] as String,
    );
  }
}
