import 'package:flutter/material.dart';
import 'package:flutter_ui_cards/config/custom_theme.dart';

class CardIcon extends StatelessWidget {
  final IconData icon;

  const CardIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: CustomTheme.grey,
      size: 36,
    );
  }
}
