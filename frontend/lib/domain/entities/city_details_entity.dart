class CityDetailsEntity {
  final String title;
  final List<TopicEntity> topics;

  CityDetailsEntity({
    required this.title,
    required this.topics,
  });
}

class TopicEntity {
  final String title;
  final String description;

  TopicEntity({
    required this.title,
    required this.description,
  });
}
