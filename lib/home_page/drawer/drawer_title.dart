import 'package:flutter/material.dart';
import 'package:flutter_ui_cards/config/custom_theme.dart';

class DrawerTitle extends StatelessWidget {
  final String title;

  const DrawerTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Text(
        title,
        style: const TextStyle(
          color: CustomTheme.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
