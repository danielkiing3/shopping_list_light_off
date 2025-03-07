import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/home_screen/presentation/widgets/scale_theme_element.dart';

class ContentCardInfoTag extends StatelessWidget {
  const ContentCardInfoTag({super.key, required this.name, required this.icon});

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ScaleThemeElement(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [Icon(icon, size: 16), Text(name)],
      ),
    );
  }
}
