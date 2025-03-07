import 'package:flutter/material.dart';

class ThemeModeNotifierProvider extends InheritedNotifier<ThemeModeNotifier> {
  const ThemeModeNotifierProvider({
    super.key,
    required super.child,
    required ThemeModeNotifier themeModeNotifier,
  }) : super(notifier: themeModeNotifier);

  static ThemeModeNotifier of(BuildContext context) {
    final ThemeModeNotifier? provider = maybeOf(context);
    assert(provider != null, 'No ThemeModeNotifierProvider found in context');
    return provider!;
  }

  static ThemeModeNotifier? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ThemeModeNotifierProvider>()
        ?.notifier;
  }

  @override
  bool updateShouldNotify(ThemeModeNotifierProvider oldWidget) =>
      oldWidget.notifier?.value != notifier?.value;
}

extension ThemeModeProviderExtension on BuildContext {
  ThemeModeNotifier get themeModeNotifier => ThemeModeNotifierProvider.of(this);
}

class ThemeModeNotifier extends ValueNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.dark);

  void updateThemeMode() {
    if (value == ThemeMode.light) {
      value = ThemeMode.dark;
    } else {
      value = ThemeMode.light;
    }
  }
}
