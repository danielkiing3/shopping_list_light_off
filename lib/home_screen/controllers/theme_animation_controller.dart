import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/theme/theme.dart';

class ThemeAnimationNotifier extends ChangeNotifier {
  int _animationTrigger = 0;
  bool _hasTriggeredThemeChange = false;

  int get animationTrigger => _animationTrigger;

  void triggerAnimations(BuildContext context) {
    _animationTrigger++;
    _hasTriggeredThemeChange = false;
    notifyListeners();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (!_hasTriggeredThemeChange) {
        _hasTriggeredThemeChange = true;
        if (context.mounted) {
          context.themeModeNotifier.updateThemeMode();
        }
      }
    });
  }
}

class ThemeAnimationNotifierProvider
    extends InheritedNotifier<ThemeAnimationNotifier> {
  const ThemeAnimationNotifierProvider({
    super.key,
    required super.child,
    required ThemeAnimationNotifier notifier,
  }) : super(notifier: notifier);

  static ThemeAnimationNotifier? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ThemeAnimationNotifierProvider>()
        ?.notifier;
  }
}

extension ThemeAnimationControllerExtension on BuildContext {
  ThemeAnimationNotifier get themeAnimationNotifier =>
      ThemeAnimationNotifierProvider.of(this)!;
}
