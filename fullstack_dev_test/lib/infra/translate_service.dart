mixin TranslateService {
  String translate(String key);
}

class TranslateServiceImpl implements TranslateService {
  @override
  String translate(String key) {
    return _translateKeys[key] ?? key;
  }
}

/// Não deu tempo de finzalizar a implementação do TranslateService
/// Adicionei esse Map para simular a tradução
final _translateKeys = <String, String>{
  'countries': 'Países',
  'topics_not_found': 'Não foram encontrados tópicos para esta cidade.',
  'datasource_error_firestore': 'Algo deu errado com o banco de dados.',
  'datasource_error_gemini': 'Algo deu errado com o serviço de terceiros.',
  'not_found_country': 'País não encontrado.',
  'not_found_cities': 'Cidades não encontradas.',
  'platform_error': 'Algo deu errado :(',
};
