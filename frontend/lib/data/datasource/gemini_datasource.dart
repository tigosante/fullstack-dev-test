import 'dart:convert';

import 'package:flutter_gemini/flutter_gemini.dart' show Gemini;
import 'package:fullstack_dev_test/exceptions/exceptions.dart'
    show DatasourceException;

mixin GeminiDataSource {
  Future<Map<String, dynamic>> getCityDetails({
    required String city,
    required String country,
    required String subCountry,
  });
}

class GeminiDataSourceImpl implements GeminiDataSource {
  GeminiDataSourceImpl({
    required Gemini client,
  }) : _client = client;

  final Gemini _client;

  /// O prompt deve ser inserido no backend
  String _getPrompts({
    required String city,
    required String country,
    required String subCountry,
  }) {
    return '''
    me mostre dados sobre o que fazer na cidade : $city - $subCountry - $country
    - use o seguinte modelo: {
      "title": "breve descrição da cidade",
      "topics": [
        {
          "title": "titulo do topico",
          "description": "descrição do topico"
        }
      ]
    }
    o retorno deve conter apenas um json e nada mais''';
  }

  @override
  Future<Map<String, dynamic>> getCityDetails({
    required String city,
    required String country,
    required String subCountry,
  }) async {
    try {
      final response = await _client.text(
        _getPrompts(city: city, country: country, subCountry: subCountry),
      );
      final data = response?.content?.parts?.last.text?.trim();
      return jsonDecode(data ?? '{}') as Map<String, dynamic>;
    } on Exception {
      throw DatasourceException(clientName: 'gemini');
    }
  }
}
