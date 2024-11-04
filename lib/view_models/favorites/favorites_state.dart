import 'package:monkey_ao/model/animals_model.dart';

class FavoritesState {
  final List<AnimalsModel> favoritesList;

  FavoritesState({
    this.favoritesList = const [],
  });

  FavoritesState copyWith({
    List<AnimalsModel>? favoritesList,
  }) {
    return FavoritesState(
      favoritesList: favoritesList ?? this.favoritesList,
    );
  }
}
