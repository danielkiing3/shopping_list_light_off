import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color background;

  final Color surface;

  final Color surfaceSecondary;

  final Color textDefault;

  final Color textWeak;

  final Color iconDefault;

  final Color iconHighlighted;

  const AppColorsExtension({
    required this.background,
    required this.surface,
    required this.surfaceSecondary,
    required this.textDefault,
    required this.textWeak,
    required this.iconDefault,
    required this.iconHighlighted,
  });

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? background,
    Color? surface,
    Color? surfaceSecondary,
    Color? textDefault,
    Color? textWeak,
    Color? iconDefault,
    Color? iconHighlighted,
  }) {
    return AppColorsExtension(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceSecondary: surfaceSecondary ?? this.surfaceSecondary,
      textDefault: textDefault ?? this.textDefault,
      textWeak: textWeak ?? this.textWeak,
      iconDefault: iconDefault ?? this.iconDefault,
      iconHighlighted: iconHighlighted ?? this.iconHighlighted,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(AppColorsExtension? other, double t) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceSecondary:
          Color.lerp(surfaceSecondary, other.surfaceSecondary, t)!,
      textDefault: Color.lerp(textDefault, other.textDefault, t)!,
      textWeak: Color.lerp(textWeak, other.textWeak, t)!,
      iconDefault: Color.lerp(iconDefault, other.iconDefault, t)!,
      iconHighlighted: Color.lerp(iconHighlighted, other.iconHighlighted, t)!,
    );
  }
}
