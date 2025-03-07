import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/home_screen/model/card_view_model.dart';
import 'package:shopping_list_light_off/home_screen/presentation/widgets/content_card_info_tag.dart';
import 'package:shopping_list_light_off/home_screen/presentation/widgets/content_card_title.dart';
import 'package:shopping_list_light_off/home_screen/presentation/widgets/scale_element_sticker.dart';
import 'package:shopping_list_light_off/home_screen/presentation/widgets/scale_theme_element.dart';
import 'package:shopping_list_light_off/shared/widgets/image_with_border.dart';
import 'package:shopping_list_light_off/theme/theme.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({super.key, required this.data});

  final CardViewModel data;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ScaleThemeElement(
      scaleDestination: 0.97,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: colors.surfaceSecondary,
          // color:
        ),
        height: 240,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContentCardInfoTag(
                        name: '${data.daysAgo} days ago',
                        icon: Icons.replay_outlined,
                      ),
                      ContentCardInfoTag(
                        name: data.bookmark.toString(),
                        icon: Icons.book,
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 8),
                ContentCardTitle(data: data.contentTitle),
              ],
            ),
            Positioned(
              bottom: -60,
              left: 0,
              right: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //TODO: Generate the positioned widget dynamically
                  // Set the location value based on .indexed int value
                  Positioned(
                    left: 60,
                    child: ScaleElementSticker(
                      location: 1,
                      child: SizedBox(
                        height: 160,
                        child: ImageWithBorder(image: data.displayImages[0]),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 60,
                    child: ScaleElementSticker(
                      location: 2,
                      child: SizedBox(
                        height: 160,
                        child: ImageWithBorder(image: data.displayImages[1]),
                      ),
                    ),
                  ),
                  Positioned(
                    child: ScaleElementSticker(
                      location: 3,
                      child: SizedBox(
                        height: 160,
                        child: ImageWithBorder(image: data.displayImages[2]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
