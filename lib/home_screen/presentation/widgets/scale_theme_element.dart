import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/home_screen/controllers/theme_animation_controller.dart';

class ScaleThemeElement extends StatefulWidget {
  const ScaleThemeElement({
    super.key,
    required this.child,
    this.scaleDestination,
  });

  final Widget child;
  final double? scaleDestination;

  @override
  State<ScaleThemeElement> createState() => _ScaleThemeElementState();
}

class _ScaleThemeElementState extends State<ScaleThemeElement>
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

  late final _scale = Tween<double>(
    begin: 1,
    end: widget.scaleDestination ?? 0.9,
  ).animate(_curvedAnimation);

  @override
  void initState() {
    super.initState();
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
      child: ScaleTransition(scale: _scale, child: widget.child),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _curvedAnimation.dispose();
    super.dispose();
  }
}
