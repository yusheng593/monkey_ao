import 'package:monkey_ao/model/animals_model.dart';

class AnimalsState {
  final int currentOffset;
  final List<AnimalsModel> animalsList;
  final bool isLoading;
  final String fetchAnimalsError;

  AnimalsState({
    this.currentOffset = 0,
    this.animalsList = const [],
    this.isLoading = false,
    this.fetchAnimalsError = '',
  });

  AnimalsState copyWith(
      {int? currentOffset,
      List<AnimalsModel>? animalsList,
      bool? isLoading,
      String? fetchAnimalsError}) {
    return AnimalsState(
      currentOffset: currentOffset ?? this.currentOffset,
      animalsList: animalsList ?? this.animalsList,
      isLoading: isLoading ?? this.isLoading,
      fetchAnimalsError: fetchAnimalsError ?? this.fetchAnimalsError,
    );
  }
}
