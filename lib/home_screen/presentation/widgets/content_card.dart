import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/home_screen/model/content_title.dart';
import 'package:shopping_list_light_off/home_screen/presentation/widgets/content_card_info_tag.dart';
import 'package:shopping_list_light_off/home_screen/presentation/widgets/content_card_title.dart';
import 'package:shopping_list_light_off/theme/theme.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: colors.surfaceSecondary,
        // color:
      ),
      height: 240,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ContentCardInfoTag(
                  name: '2 days ago',
                  icon: Icons.replay_outlined,
                ),
                ContentCardInfoTag(name: '14', icon: Icons.book),
              ],
            ),
          ),
          // const SizedBox(height: 8),
          ContentCardTitle(
            data: ContentTitle(
              title: 'Sunday Brunch Prep',
              subtitle: 'Ready for fresh crossiants and OJ!',
            ),
          ),
        ],
      ),
    );
  }
}
