import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/home_screen/presentation/widgets/scale_theme_element.dart';
import 'package:shopping_list_light_off/theme/theme.dart';

class ContentCardInfoTag extends StatelessWidget {
  const ContentCardInfoTag({super.key, required this.name, required this.icon});

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ScaleThemeElement(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          Icon(
            icon,
            size: 16,
            color: colors.iconDefault.withValues(alpha: 0.7),
          ),
          Text(name),
        ],
      ),
    );
  }
}
