import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/theme/theme.dart';

class AppChip extends StatelessWidget {
  const AppChip({super.key, required this.data, this.isSelected = false});

  final String data;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: isSelected ? colors.textDefault : colors.surfaceSecondary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Text(
          data,
          style: context.textStyles.bodyLarge.copyWith(
            color: isSelected ? colors.background : colors.textDefault,
          ),
        ),
      ),
    );
  }
}
