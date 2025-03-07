import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/home_screen/model/card_view_model.dart';

import 'package:shopping_list_light_off/home_screen/presentation/widgets/scale_theme_element.dart';
import 'package:shopping_list_light_off/theme/theme.dart';

class ContentCardTitle extends StatelessWidget {
  const ContentCardTitle({super.key, required this.data});

  final ContentTitle data;

  @override
  Widget build(BuildContext context) {
    return ScaleThemeElement(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: context.textStyles.heading.copyWith(fontSize: 30),
          ),
          const SizedBox(height: 5),
          Text(data.subtitle),
        ],
      ),
    );
  }
}
