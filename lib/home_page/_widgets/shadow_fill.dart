import 'package:flutter/material.dart';

class ShadowFill extends StatelessWidget {
  final Color color;

  const ShadowFill({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              color.withOpacity(.1),
              color.withOpacity(0),
            ],
          ),
        ),
      ),
    );
  }
}
