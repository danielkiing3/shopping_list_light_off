import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TwoDimensionOverlay extends TwoDimensionalScrollView {
  TwoDimensionOverlay({
    super.key,
    super.clipBehavior = Clip.hardEdge,
    super.diagonalDragBehavior = DiagonalDragBehavior.free,
    super.dragStartBehavior = DragStartBehavior.start,
    super.hitTestBehavior = HitTestBehavior.opaque,
    super.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    super.mainAxis = Axis.vertical,
    super.primary = false,
    super.cacheExtent,

    required super.delegate,
  }) : super(
         horizontalDetails: ScrollableDetails.horizontal(
           controller: ScrollController(initialScrollOffset: 100),
         ),
         verticalDetails: ScrollableDetails.vertical(
           controller: ScrollController(initialScrollOffset: 100),
         ),
       );

  @override
  Widget buildViewport(
    BuildContext context,
    ViewportOffset verticalOffset,
    ViewportOffset horizontalOffset,
  ) {
    return TwoDimensionOverlayViewPort(
      verticalOffset: verticalOffset,
      verticalAxisDirection: verticalDetails.direction,
      horizontalOffset: horizontalOffset,
      horizontalAxisDirection: horizontalDetails.direction,
      delegate: delegate,
      mainAxis: mainAxis,
      cacheExtent: cacheExtent,
      clipBehavior: clipBehavior,
    );
  }
}

class TwoDimensionOverlayViewPort extends TwoDimensionalViewport {
  const TwoDimensionOverlayViewPort({
    super.key,
    required super.verticalOffset,
    required super.verticalAxisDirection,
    required super.horizontalOffset,
    required super.horizontalAxisDirection,
    required super.delegate,
    required super.mainAxis,
    super.cacheExtent,
    super.clipBehavior,
  });

  @override
  RenderTwoDimensionOverlayViewPort createRenderObject(BuildContext context) {
    return RenderTwoDimensionOverlayViewPort(
      verticalOffset: verticalOffset,
      verticalAxisDirection: verticalAxisDirection,
      horizontalOffset: horizontalOffset,
      horizontalAxisDirection: horizontalAxisDirection,
      delegate: delegate as TwoDimensionalChildBuilderDelegate,
      mainAxis: mainAxis,
      cacheExtent: cacheExtent,
      clipBehavior: clipBehavior,
      childManager: context as TwoDimensionalChildManager,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderTwoDimensionOverlayViewPort renderObject,
  ) {
    renderObject
      ..verticalOffset = verticalOffset
      ..verticalAxisDirection = verticalAxisDirection
      ..horizontalOffset = horizontalOffset
      ..horizontalAxisDirection = horizontalAxisDirection
      ..delegate = delegate
      ..mainAxis = mainAxis
      ..cacheExtent = cacheExtent
      ..clipBehavior = clipBehavior;
  }
}

class RenderTwoDimensionOverlayViewPort extends RenderTwoDimensionalViewport {
  RenderTwoDimensionOverlayViewPort({
    required super.childManager,
    required super.verticalOffset,
    required super.verticalAxisDirection,
    required super.horizontalOffset,
    required super.horizontalAxisDirection,
    required super.delegate,
    required super.mainAxis,
    super.cacheExtent,
    super.clipBehavior,
  });

  final Map<ChildVicinity, Offset> _randomOffsets = {};
  final math.Random _random = math.Random();

  @override
  void layoutChildSequence() {
    final double horizontalPixels = horizontalOffset.pixels;
    final double verticalPixels = verticalOffset.pixels;
    final double viewportWidth = viewportDimension.width + cacheExtent;
    final double viewportHeight = viewportDimension.height + cacheExtent;

    const double baseSpacing = 240;

    final TwoDimensionalChildBuilderDelegate builderDelegate =
        delegate as TwoDimensionalChildBuilderDelegate;

    final int maxRowIndex = builderDelegate.maxYIndex!;
    final int maxColumnIndex = builderDelegate.maxXIndex!;

    final int leadingColumn = math.max(
      (horizontalPixels / baseSpacing).floor(),
      0,
    );
    final int leadingRow = math.max((verticalPixels / baseSpacing).floor(), 0);
    final int trailingColumn = math.min(
      ((horizontalPixels + viewportWidth) / baseSpacing).ceil(),
      maxColumnIndex,
    );
    final int trailingRow = math.min(
      ((verticalPixels + viewportHeight) / baseSpacing).ceil(),
      maxRowIndex,
    );

    double xLayoutOffset =
        (leadingColumn * baseSpacing) - horizontalOffset.pixels + 20;
    for (int column = leadingColumn; column <= trailingColumn; column++) {
      double yLayoutOffset =
          (leadingRow * baseSpacing) - verticalOffset.pixels + 20;
      for (int row = leadingRow; row <= trailingRow; row++) {
        final ChildVicinity vicinity = ChildVicinity(
          xIndex: column,
          yIndex: row,
        );

        final RenderBox child = buildOrObtainChildFor(vicinity)!;
        child.layout(constraints.loosen());

        _randomOffsets.putIfAbsent(
          vicinity,
          () => Offset(
            _random.nextDouble() * 100 - 50,
            _random.nextDouble() * 100 - 50,
          ),
        );

        final Offset scatterOffset = _randomOffsets[vicinity]!;

        final finalOffset = Offset(
          xLayoutOffset + scatterOffset.dx,
          yLayoutOffset + scatterOffset.dy,
        );

        parentDataOf(child).layoutOffset = finalOffset;

        yLayoutOffset += baseSpacing;
      }
      xLayoutOffset += baseSpacing;
    }

    final double verticalExtent = baseSpacing * (maxColumnIndex + 1);
    verticalOffset.applyContentDimensions(
      0.0,
      (verticalExtent - viewportDimension.height).clamp(0.0, double.infinity),
    );

    final double horizontalExtent = baseSpacing * (maxRowIndex + 1);
    horizontalOffset.applyContentDimensions(
      0.0,
      (horizontalExtent - viewportDimension.width).clamp(0.0, double.infinity),
    );
  }
}
