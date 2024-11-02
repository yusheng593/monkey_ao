import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monkey_ao/constants/app_icons.dart';

class FavoriteButtonWidget extends ConsumerWidget {
  const FavoriteButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          AppIcons.favoriteOutlineRounded,
          color: Colors.red,
          size: 30,
        ));
  }
}
