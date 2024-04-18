import 'package:fullstack_dev_test/domain/entities/entities.dart'
    show CityDetailsEntity, TopicEntity;

class CityDetailsDTO extends CityDetailsEntity {
  CityDetailsDTO({
    required super.title,
    required super.topics,
  });

  factory CityDetailsDTO.fromJson(Map<String, dynamic> map) {
    return CityDetailsDTO(
      title: map['title'] as String,
      topics: List.from(map['topics'])
          .map((e) => TopicDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class TopicDTO extends TopicEntity {
  TopicDTO({
    required super.title,
    required super.description,
  });

  factory TopicDTO.fromJson(Map<String, dynamic> map) {
    return TopicDTO(
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }
}
