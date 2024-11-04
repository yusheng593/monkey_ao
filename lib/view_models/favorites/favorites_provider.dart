import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monkey_ao/model/animals_model.dart';
import 'package:monkey_ao/view_models/favorites/favorites_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesProvider, FavoritesState>(
        (_) => FavoritesProvider());

class FavoritesProvider extends StateNotifier<FavoritesState> {
  FavoritesProvider() : super(FavoritesState());

  final favoritesKey = 'favoritesKey';

  bool isFavorite(AnimalsModel animalsModel) {
    return state.favoritesList.any((movie) => movie.id == animalsModel.id);
  }

  // 新增或移除最愛
  Future<void> addOrRemoveFromFavorites(AnimalsModel movieModel) async {
    bool wasFavorite = isFavorite(movieModel);
    final List<AnimalsModel> updatedFavorites = wasFavorite
        ? state.favoritesList
            .where(
              (element) => element.id != movieModel.id,
            )
            .toList()
        : [...state.favoritesList, movieModel];
    state = state.copyWith(favoritesList: updatedFavorites);
    await saveFavorites();
  }

  // 存進本機
  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = state.favoritesList
        .map((animal) => json.encode(animal.toJson()))
        .toList();
    prefs.setStringList(favoritesKey, stringList);
  }

  // 從本機讀取
  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList(favoritesKey) ?? [];
    final List<AnimalsModel> newFavoritesList = stringList
        .map((animal) => AnimalsModel.fromJson(json.decode(animal)))
        .toList();

    state = state.copyWith(favoritesList: newFavoritesList);
  }

  void clearAllFavorites() {
    state = state.copyWith(favoritesList: []);

    saveFavorites();
  }
}
