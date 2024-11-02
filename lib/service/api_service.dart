import 'dart:convert';

import 'package:monkey_ao/constants/animals_api_constants.dart';
import 'package:monkey_ao/constants/app_icons.dart';
import 'package:monkey_ao/model/animals_model.dart';

import 'package:http/http.dart' as http;

class ApiService {
  Future<List<AnimalsModel>> fetchAnimals({int offset = 0}) async {
    final url = Uri.parse(
        '${AnimalsApiConstants.baseUrl}6afa114d-38a2-4e3c-9cfd-29d3bd26b65b?scope=resourceAquire&resource_id=6afa114d-38a2-4e3c-9cfd-29d3bd26b65b&limit=20&offset=$offset');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      final data = jsonDecode(decodedBody);
      // log('🐒 data: $data');
      return List.from(data['result']['results']
          .map((element) => AnimalsModel.fromJson(element)));
    } else {
      throw Exception('${AppIcons.error} error: 錯誤 ${response.statusCode}');
    }
  }
}
