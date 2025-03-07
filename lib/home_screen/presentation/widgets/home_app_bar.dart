import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/shared/widgets/tap_scaler.dart';
import 'package:shopping_list_light_off/theme/theme.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return DecoratedBox(
      decoration: BoxDecoration(color: colors.background),
      child: SafeArea(
        child: SizedBox.fromSize(
          size: preferredSize,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 26),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.arrow_back),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 26),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 12,
                    children: [
                      TapScaler(
                        onTap: () {
                          ThemeModeNotifierProvider.of(
                            context,
                          ).updateThemeMode();
                        },
                        child: Icon(Icons.wb_sunny_outlined),
                      ),
                      Icon(Icons.sort),
                    ],
                  ),
                ),
              ),
              Center(
                child: Text(
                  'My Lists',
                  style: context.textStyles.heading.copyWith(
                    color: colors.textDefault,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(46);
}
