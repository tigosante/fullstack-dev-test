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
  'retry': 'Tentar novamente',
  'countries': 'Países',
  'topics_not_found': 'Não foram encontrados tópicos para esta cidade.',
  'datasource_error_firestore': 'Algo deu errado com o banco de dados.',
  'datasource_error_gemini': 'Algo deu errado com o serviço de terceiros.',
  'datasource_error': 'Algo deu errado',
  'not_found_country': 'País não encontrado.',
  'not_found_cities': 'Cidades não encontradas.',
  'page_not_found_title': '404',
  'page_not_found_message':
      'Página não encontrada, volte para a página inicial.',
  'page_not_found_button': 'Voltar para a página inicial',
  'platform_error': 'Algo deu errado :(',
};
