import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/theme/theme.dart';

class ScaleThemeElement extends StatefulWidget {
  const ScaleThemeElement({super.key, required this.child});

  final Widget child;

  @override
  State<ScaleThemeElement> createState() => _ScaleThemeElementState();
}

class _ScaleThemeElementState extends State<ScaleThemeElement>
    with SingleTickerProviderStateMixin {
  ThemeMode? _previousThemeMode;

  late final _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 150),
  );

  late final _curvedAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutSine,
    reverseCurve: Curves.easeOutSine.flipped,
  );

  late final _scale = Tween<double>(
    begin: 1,
    end: 0.9,
  ).animate(_curvedAnimation);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final themeMode = context.themeModeNotifier.value;

    if (_previousThemeMode != themeMode) {
      _controller.forward().then((_) => _controller.reverse());
      _previousThemeMode = themeMode;
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
