import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_cards/blocs/settings_cubit/settings_cubit.dart';
import 'package:flutter_ui_cards/config/custom_theme.dart';

class ColorSelector extends StatelessWidget {
  final Color color;
  final bool isActive;

  const ColorSelector({
    super.key,
    required this.color,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        child: Container(
          height: 20.0,
          width: 20.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: isActive
                ? Border.all(width: 2.0, color: CustomTheme.white)
                : null,
          ),
          child: isActive
              ? const Icon(
                  Icons.done,
                )
              : const SizedBox(),
        ),
        onTap: () => context.read<SettingsCubit>().changeColor(color),
      ),
    );
  }
}
