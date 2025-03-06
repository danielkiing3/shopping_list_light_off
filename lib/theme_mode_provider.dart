import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list_light_off/theme_mode_controller.dart';

// Using InheritedNotifier instead of InheritedWidget
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

// // Using InheritedWidget instead of InheritedNotifier
// class ThemeModeProvider extends InheritedWidget {
//   final ThemeModeController themeModeController;

//   const ThemeModeProvider({
//     super.key,
//     required super.child,
//     required this.themeModeController,
//   });

//   static ThemeModeController of(BuildContext context) {
//     final ThemeModeController? provider = maybeOf(context);
//     assert(provider != null, 'No ThemeModeProvider found in context');
//     return provider!;
//   }

//   static ThemeModeController? maybeOf(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<ThemeModeProvider>()
//         ?.themeModeController;
//   }

//   @override
//   bool updateShouldNotify(ThemeModeProvider oldWidget) =>
//       oldWidget.themeModeController != themeModeController;
// }
