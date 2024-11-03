import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monkey_ao/constants/app_icons.dart';
import 'package:monkey_ao/enums/theme_enum.dart';
import 'package:monkey_ao/view_models/animal/animals_provider.dart';
import 'package:monkey_ao/view_models/theme_provider.dart';
import 'package:monkey_ao/widgets/animal_widget.dart';

class AnimalScreen extends StatelessWidget {
  const AnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('臺北市立動物園'),
        actions: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? _) {
              final themeState = ref.watch(themeProvider);
              return IconButton(
                  onPressed: () async {
                    await ref.read(themeProvider.notifier).toggleTheme();
                  },
                  icon: Icon(themeState == ThemeEnum.ligth
                      ? AppIcons.lightMode
                      : AppIcons.darkMode));
            },
          )
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
