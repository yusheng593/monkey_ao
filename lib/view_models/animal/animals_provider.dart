import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monkey_ao/constants/app_constants.dart';
import 'package:monkey_ao/model/animals_model.dart';
import 'package:monkey_ao/repository/animals_repo.dart';
import 'package:monkey_ao/service/init_getit.dart';
import 'package:monkey_ao/service/navigation_service.dart';
import 'package:monkey_ao/view_models/animal/animals_state.dart';

final animalsProvider = StateNotifierProvider<AnimalsProvider, AnimalsState>(
    (_) => AnimalsProvider());

class AnimalsProvider extends StateNotifier<AnimalsState> {
  AnimalsProvider() : super(AnimalsState());

  final AnimalsRepo _animalsRepo = getIt<AnimalsRepo>();

  Future<void> getAnimals() async {
    if (state.isLoading) {
      return;
    }
    state = state.copyWith(isLoading: true);

    try {
      List<AnimalsModel> animals =
          await _animalsRepo.fetchAnimals(state.currentOffset);

      state = state.copyWith(
        animalsList: [...state.animalsList, ...animals],
        currentOffset: state.currentOffset + AppConstants.limit,
        fetchAnimalsError: '',
        isLoading: false,
      );
    } catch (error) {
      state =
          state.copyWith(fetchAnimalsError: error.toString(), isLoading: false);
      log('🐒 錯誤訊息： $error');
      getIt<NavigationService>().showSnackbar(error.toString());
      rethrow;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
