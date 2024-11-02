import 'package:get_it/get_it.dart';
import 'package:monkey_ao/repository/animals_repo.dart';
import 'package:monkey_ao/service/api_service.dart';
import 'package:monkey_ao/service/navigation_service.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<AnimalsRepo>(
      () => AnimalsRepo(getIt<ApiService>()));
}
