import 'dart:ui';

import 'package:flutter/material.dart';

/// Custom widget that takes in a [String] or [ImageProvider] and apply a border
/// of color [borderColor]
class ImageWithBorder extends StatelessWidget {
  const ImageWithBorder({
    super.key,
    this.image,
    this.imageProvider,
    this.borderColor = Colors.white,
    this.borderWidth = 4.0,
  }) : assert(
         image != null || imageProvider != null,
         'Either image or imageProvider must be provided',
       );

  final String? image;
  final ImageProvider? imageProvider;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final ImageProvider actualImageProvider =
        imageProvider ?? AssetImage(image!);

    Widget child = Image(image: actualImageProvider);

    return Stack(
      children: [
        // -- Border
        ImageFiltered(
          imageFilter: ImageFilter.dilate(
            radiusX: borderWidth,
            radiusY: borderWidth,
          ),
          child: Image(image: actualImageProvider, color: borderColor),
        ),

        // -- Actual Image
        child,
      ],
    );
  }
}
