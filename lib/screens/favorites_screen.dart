import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monkey_ao/constants/app_icons.dart';
import 'package:monkey_ao/view_models/favorites/favorites_provider.dart';
import 'package:monkey_ao/widgets/animal_widget.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('喜愛的動物'),
        actions: [
          IconButton(
            onPressed: favoritesState.favoritesList.isEmpty
                ? null
                : () {
                    ref.read(favoritesProvider.notifier).clearAllFavorites();
                  },
            icon: Icon(
              AppIcons.delete,
              color: favoritesState.favoritesList.isEmpty
                  ? Colors.grey
                  : Colors.red,
            ),
          )
        ],
      ),
      body: favoritesState.favoritesList.isEmpty
          ? Center(
              child: Text(
                '還沒有小動物住在這裡',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: favoritesState.favoritesList.length,
              itemBuilder: (context, index) {
                return AnimalWidget(
                  animalModel:
                      favoritesState.favoritesList.reversed.toList()[index],
                );
              }),
    );
  }
}
