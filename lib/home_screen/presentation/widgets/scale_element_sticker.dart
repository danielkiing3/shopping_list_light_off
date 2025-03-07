import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/home_screen/controllers/theme_animation_controller.dart';

import 'dart:math' as math;

class ScaleElementSticker extends StatefulWidget {
  const ScaleElementSticker({
    super.key,
    required this.location,
    required this.child,
  });

  final int location;
  final Widget child;

  @override
  State<ScaleElementSticker> createState() => _ScaleElementStickerState();
}

class _ScaleElementStickerState extends State<ScaleElementSticker>
    with SingleTickerProviderStateMixin {
  int? _prevTrigger;

  late final _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 200),
  );

  late final _curvedAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutSine,
    reverseCurve: Curves.easeOutSine.flipped,
  );

  late Animation<double> _turns;

  @override
  void initState() {
    super.initState();

    _turns = _generateRotationTween().animate(_curvedAnimation);
  }

  Tween<double> _generateRotationTween() {
    double startAngle, endAngle;

    switch (widget.location) {
      case 3:
        startAngle = -2; // Equivalent to 358° (same as -2°)
        endAngle = 2;
        break;
      case 2:
        startAngle = 2;
        endAngle = -2;
        break;
      case 1:
        startAngle = -2;
        endAngle = -6;
        break;
      default:
        startAngle = 0;
        endAngle = 0;
    }

    return Tween<double>(
      begin: startAngle * (math.pi / 180),
      end: endAngle * (math.pi / 180),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final themeNotifier = context.themeAnimationNotifier;

    if (_prevTrigger != themeNotifier.animationTrigger) {
      _prevTrigger = themeNotifier.animationTrigger;
      _controller.forward();
      Future.delayed(const Duration(milliseconds: 500), () {
        if (context.mounted) {
          _controller.reverse();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: RotationTransition(turns: _turns, child: widget.child),
    );
  }
}
