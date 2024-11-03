import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monkey_ao/constants/app_colors.dart';
import 'package:monkey_ao/screens/animals_screen.dart';
import 'package:monkey_ao/service/init_getit.dart';
import 'package:monkey_ao/service/navigation_service.dart';
import 'package:monkey_ao/view_models/animal/animals_provider.dart';

final initProvider = FutureProvider.autoDispose<void>((ref) async {
  ref.keepAlive();
  await Future.microtask(() async {
    await ref.read(animalsProvider.notifier).getAnimals();
  });
});

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initWatch = ref.watch(initProvider);
    return initWatch.when(data: (_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        getIt<NavigationService>()
            .navigatePushReplacement(const AnimalScreen());
      });
      return const Scaffold(body: SizedBox.shrink());
    }, error: (error, _) {
      log('🐒 ${error.toString()}');
      return const SizedBox.shrink();
      // TODO:錯誤畫面
    }, loading: () {
      return Transform.scale(
        scale: 2,
        child: CupertinoActivityIndicator(
          color: AppColors.titleColor,
        ),
      );
    });
  }
}
