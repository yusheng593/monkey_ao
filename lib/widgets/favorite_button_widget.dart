import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monkey_ao/constants/app_icons.dart';
import 'package:monkey_ao/model/animals_model.dart';
import 'package:monkey_ao/view_models/favorites/favorites_provider.dart';

class FavoriteButtonWidget extends ConsumerWidget {
  const FavoriteButtonWidget(this.animalsModel, {super.key});
  final AnimalsModel animalsModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(favoritesProvider);
    return IconButton(
        onPressed: () {
          ref
              .read(favoritesProvider.notifier)
              .addOrRemoveFromFavorites(animalsModel);
        },
        icon: Icon(
          ref.read(favoritesProvider.notifier).isFavorite(animalsModel)
              ? AppIcons.favorite
              : AppIcons.favoriteOutlineRounded,
          color: Colors.red,
          size: 30,
        ));
  }
}
