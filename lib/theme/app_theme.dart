import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/theme/app_colors.dart';
import 'package:shopping_list_light_off/theme/app_colors_extension.dart';
import 'package:shopping_list_light_off/theme/app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: const ColorScheme.light(),
      scaffoldBackgroundColor: AppColors.lightBackground,
      dividerTheme: const DividerThemeData(
        color: AppColors.lightBorderDefault,
        space: 0,
        thickness: 1,
      ),
      extensions: const [
        AppColorsExtension(
          background: AppColors.lightBackground,
          surface: AppColors.lightSurface,
          surfaceSecondary: AppColors.lightSurfaceSecondary,
          textDefault: AppColors.lightTextDefault,
          textWeak: AppColors.lightTextWeak,
          iconDefault: AppColors.lightIconDefault,
          iconHighlighted: AppColors.lightIconHighlighted,
        ),
      ],
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: const ColorScheme.dark(),
      scaffoldBackgroundColor: AppColors.darkBackground,
      dividerTheme: const DividerThemeData(
        color: AppColors.darkBorderDefault,
        space: 0,
        thickness: 1,
      ),
      extensions: const [
        AppColorsExtension(
          background: AppColors.darkBackground,
          surface: AppColors.darkSurface,
          surfaceSecondary: AppColors.darkSurfaceSecondary,
          textDefault: AppColors.darkTextDefault,
          textWeak: AppColors.darkTextWeak,
          iconDefault: AppColors.darkIconDefault,
          iconHighlighted: AppColors.darkIconHighlighted,
        ),
      ],
    );
  }
}

extension AppTheming on BuildContext {
  AppColorsExtension get colors =>
      Theme.of(this).extension<AppColorsExtension>()!;

  AppTextStyles get textStyles => const AppTextStyles();
}
