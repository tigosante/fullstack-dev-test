import 'package:fullstack_dev_test/domain/entities/entities.dart'
    show CityDetailsEntity, TopicEntity;

class CityDetailsDTO extends CityDetailsEntity {
  CityDetailsDTO({
    required super.title,
    required super.topics,
  });

  factory CityDetailsDTO.fromJson(Map<String, dynamic> map) {
    return CityDetailsDTO(
      title: (map['title'] as String).trim(),
      topics: List<TopicDTO>.from(map['topics'] as Iterable)
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
      title: (map['title'] as String).trim(),
      description: (map['description'] as String).trim(),
    );
  }
}
