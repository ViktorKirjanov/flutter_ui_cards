import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_ui_cards/home_page/_widgets/transform_item.dart';
import 'package:flutter_ui_cards/home_page/_widgets/user_card/user_card.dart';

class PerspectiveItems extends StatelessWidget {
  final int visualizedCount;
  final int currentIndex;
  final double itemHeight;
  final double pagePersent;
  final List<UserCard> children;

  const PerspectiveItems({
    super.key,
    required this.visualizedCount,
    required this.currentIndex,
    required this.itemHeight,
    required this.pagePersent,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final layoutHeight = constraints.maxHeight;

      return Stack(
        fit: StackFit.expand,
        children: List.generate(visualizedCount, (index) {
          final invertedIndex = (visualizedCount - 2) - index;
          final indexPlus = index + 1;
          final positionPersent = indexPlus / visualizedCount;
          final endPositionPersent = index / visualizedCount;

          return (currentIndex > invertedIndex)
              ? TransformItem(
                  userCard: children[currentIndex - (invertedIndex + 1)],
                  itemHeight: itemHeight,
                  factorChange: pagePersent,
                  scale: lerpDouble(.5, 1.0, positionPersent)!,
                  endScale: lerpDouble(.5, 1.0, endPositionPersent)!,
                  translateY: (layoutHeight - itemHeight) * positionPersent,
                  endTranslateY:
                      (layoutHeight - itemHeight) * endPositionPersent,
                )
              : const SizedBox();
        })
          //Bottom card
          ..add((currentIndex < children.length - 1)
              ? TransformItem(
                  userCard: children[currentIndex + 1],
                  itemHeight: itemHeight,
                  factorChange: pagePersent,
                  translateY: layoutHeight + 20,
                  endTranslateY: (layoutHeight - itemHeight),
                )
              : const SizedBox())
          //Top item
          ..insert(
              0,
              (currentIndex > (visualizedCount - 1))
                  ? TransformItem(
                      userCard: children[currentIndex - visualizedCount],
                      itemHeight: itemHeight,
                      factorChange: 1.0,
                      endScale: .5,
                    )
                  : const SizedBox()),
      );
    });
  }
}
