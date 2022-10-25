import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  final Color color;

  const CardHeader({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Align(
      heightFactor: .9,
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 4.0),
        height: 30.0,
        width: 80.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: const Icon(
          Icons.add_rounded,
          size: 30.0,
        ),
      ),
    );
  }
}
