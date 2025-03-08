import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/home_screen/model/card_view_model.dart';
import 'package:shopping_list_light_off/home_screen/presentation/widgets/content_card_info_tag.dart';
import 'package:shopping_list_light_off/home_screen/presentation/widgets/content_card_title.dart';
import 'package:shopping_list_light_off/home_screen/presentation/widgets/scale_element_sticker.dart';
import 'package:shopping_list_light_off/home_screen/presentation/widgets/scale_theme_element.dart';
import 'package:shopping_list_light_off/shared/widgets/image_with_border.dart';
import 'package:shopping_list_light_off/theme/theme.dart';

class ContentCard extends StatefulWidget {
  const ContentCard({super.key, required this.data});

  final CardViewModel data;

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard>
    with SingleTickerProviderStateMixin<ContentCard> {
  final double _containerHeight = 240;
  final double _expandedContainerHeight = 400;

  late final _controller = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  );

  late final _heightAnimation = Tween<double>(
    begin: _containerHeight,
    end: _expandedContainerHeight,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  late final _overlayAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(0.3, 1.0, curve: Curves.easeOut),
    ),
  );

  void _toggleExpansion() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final overlayHeight = _expandedContainerHeight - 130;

    return ScaleThemeElement(
      scaleDestination: 0.97,
      child: GestureDetector(
        onTap: _toggleExpansion,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: colors.surfaceSecondary,
              ),
              height: _heightAnimation.value,
              child: Stack(
                children: [
                  // Optimization
                  Stack(
                    fit: StackFit.expand,
                    children: [child!, _stickerStack()],
                  ),
                  _buildSlidingOverlay(overlayHeight, colors),
                ],
              ),
            );
          },
          child: _buildCardHeader(),
        ),
      ),
    );
  }

  Positioned _buildSlidingOverlay(
    double overlayHeight,
    AppColorsExtension colors,
  ) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: RepaintBoundary(
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: const Offset(0, 0),
            ).animate(_overlayAnimation),
            child: Container(
              height: overlayHeight,
              decoration: BoxDecoration(
                color: colors.background,
                borderRadius: BorderRadius.circular(24),
              ),
              margin: EdgeInsets.all(4),
              //TODO: Create an actual overlay
              child: Center(
                child: Text('Overlay Content', style: TextStyle(fontSize: 16)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildCardHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContentCardInfoTag(
                name: '${widget.data.daysAgo} days ago',
                icon: Icons.replay_outlined,
              ),
              ContentCardInfoTag(
                name: widget.data.bookmark.toString(),
                icon: Icons.book,
              ),
            ],
          ),
        ),
        ContentCardTitle(data: widget.data.contentTitle),
      ],
    );
  }

  Positioned _stickerStack() {
    return Positioned(
      left: 0,
      right: 0,
      top: _containerHeight - 90,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: 1 - _controller.value,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 60,
                  child: ScaleElementSticker(
                    location: 1,
                    child: SizedBox(
                      height: 160,
                      child: ImageWithBorder(
                        image: widget.data.displayImages[0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 60,
                  child: ScaleElementSticker(
                    location: 2,
                    child: SizedBox(
                      height: 160,
                      child: ImageWithBorder(
                        image: widget.data.displayImages[1],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: ScaleElementSticker(
                    location: 3,
                    child: SizedBox(
                      height: 160,
                      child: ImageWithBorder(
                        image: widget.data.displayImages[2],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
