import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monkey_ao/constants/app_theme_data.dart';
import 'package:monkey_ao/enums/theme_enum.dart';
import 'package:monkey_ao/screens/splash_screen.dart';
import 'package:monkey_ao/service/init_getit.dart';
import 'package:monkey_ao/service/navigation_service.dart';
import 'package:monkey_ao/view_models/theme_provider.dart';

void main() async {
  setupLocator(); // Initialize GetIt
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight,
  ]).then((_) async {
    await dotenv.load(fileName: "assets/.env");
    runApp(const ProviderScope(child: MainApp()));
  });
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: getIt<NavigationService>().navigatorKey,
      theme: themeState == ThemeEnum.ligth
          ? AppThemeData.lightTheme
          : AppThemeData.darkTheme,
      home: const SplashScreen(),
    );
  }
}
