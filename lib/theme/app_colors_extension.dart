import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color background;

  final Color surface;

  final Color surfaceSecondary;

  final Color scrim;

  final Color textDefault;

  final Color textWeak;

  final Color iconDefault;

  final Color iconHighlighted;

  final Color borderDefault;

  final List<Color> borderGradient;

  final List<Color> lightBorderGradient;

  final List<Color> darkBorderGradient;

  final Color skeleton;

  const AppColorsExtension({
    required this.background,
    required this.surface,
    required this.surfaceSecondary,
    required this.scrim,
    required this.textDefault,
    required this.textWeak,
    required this.iconDefault,
    required this.iconHighlighted,
    required this.borderDefault,
    required this.borderGradient,
    required this.lightBorderGradient,
    required this.darkBorderGradient,
    required this.skeleton,
  });

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? background,
    Color? surface,
    Color? surfaceSecondary,
    Color? scrim,
    Color? textDefault,
    Color? textWeak,
    Color? iconDefault,
    Color? iconHighlighted,
    Color? borderDefault,
    List<Color>? borderGradient,
    List<Color>? lightBorderGradient,
    List<Color>? darkBorderGradient,
    Color? skeleton,
  }) {
    return AppColorsExtension(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceSecondary: surfaceSecondary ?? this.surfaceSecondary,
      scrim: scrim ?? this.scrim,
      textDefault: textDefault ?? this.textDefault,
      textWeak: textWeak ?? this.textWeak,
      iconDefault: iconDefault ?? this.iconDefault,
      iconHighlighted: iconHighlighted ?? this.iconHighlighted,
      borderDefault: borderDefault ?? this.borderDefault,
      borderGradient: borderGradient ?? this.borderGradient,
      lightBorderGradient: lightBorderGradient ?? this.lightBorderGradient,
      darkBorderGradient: darkBorderGradient ?? this.darkBorderGradient,
      skeleton: skeleton ?? this.skeleton,
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
      scrim: Color.lerp(scrim, other.scrim, t)!,
      textDefault: Color.lerp(textDefault, other.textDefault, t)!,
      textWeak: Color.lerp(textWeak, other.textWeak, t)!,
      iconDefault: Color.lerp(iconDefault, other.iconDefault, t)!,
      iconHighlighted: Color.lerp(iconHighlighted, other.iconHighlighted, t)!,
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,
      borderGradient: [
        for (final (i, color) in borderGradient.indexed)
          Color.lerp(color, other.borderGradient[i], t)!,
      ],
      lightBorderGradient: lightBorderGradient,
      darkBorderGradient: darkBorderGradient,
      skeleton: Color.lerp(skeleton, other.skeleton, t)!,
    );
  }
}
