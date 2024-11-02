import 'package:flutter_dotenv/flutter_dotenv.dart';

class AnimalsApiConstants {
  static String baseUrl = dotenv.get('ANIMAL_API_URL');
}
