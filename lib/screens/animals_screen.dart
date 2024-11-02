import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monkey_ao/constants/app_constants.dart';
import 'package:monkey_ao/constants/app_icons.dart';
import 'package:monkey_ao/repository/animals_repo.dart';
import 'package:monkey_ao/service/init_getit.dart';
import 'package:monkey_ao/view_models/animals_provider.dart';
import 'package:monkey_ao/widgets/animal_widget.dart';

class AnimalScreen extends StatelessWidget {
  const AnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimalsRepo animalsRepo = getIt<AnimalsRepo>();
    int offset = 0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('臺北市立動物園'),
        actions: [
          IconButton(
              onPressed: () {
                animalsRepo.fetchAnimals(offset);
                offset += AppConstants.limit;
              },
              icon: const Icon(AppIcons.refresh))
        ],
      ),
      body: Consumer(builder: (context, WidgetRef ref, _) {
        final animalState = ref.watch(animalsProvider);

        if (animalState.isLoading && animalState.animalsList.isEmpty) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (animalState.fetchAnimalsError.isNotEmpty) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else {
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  !animalState.isLoading) {
                Future.microtask(() async {
                  await ref.read(animalsProvider.notifier).getAnimals();
                });
                return true;
              }
              return false;
            },
            child: ListView.builder(
                itemCount: animalState.animalsList.length,
                itemBuilder: (context, index) {
                  return AnimalWidget(
                    animalModel: animalState.animalsList[index],
                  );
                }),
          );
        }
      }),
    );
  }
}
