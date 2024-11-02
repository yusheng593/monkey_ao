import 'package:monkey_ao/model/animals_model.dart';
import 'package:monkey_ao/service/api_service.dart';

class AnimalsRepo {
  final ApiService _apiService;

  AnimalsRepo(this._apiService);

  Future<List<AnimalsModel>> fetchAnimals(int offset) async {
    return await _apiService.fetchAnimals(offset: offset);
  }
}
