import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/home_screen/controllers/theme_animation_controller.dart';
import 'package:shopping_list_light_off/home_screen/presentation/home_screen.dart';
import 'package:shopping_list_light_off/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeAnimationNotifierProvider(
      notifier: ThemeAnimationNotifier(),
      child: ThemeModeNotifierProvider(
        themeModeNotifier: ThemeModeNotifier(),
        child: Builder(
          builder: (context) {
            return ValueListenableBuilder(
              valueListenable: ThemeModeNotifierProvider.of(context),
              builder: (context, themeMode, _) {
                return MaterialApp(
                  title: 'Shopping List Light Off',
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: themeMode,
                  home: HomeScreen(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
