import 'dart:math' as math;
import 'package:flutter/material.dart';

class ViewTransition extends StatelessWidget {
  const ViewTransition({super.key, required this.child, this.direction = 'scale'});
  final Widget child;
  final String direction;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      transitionBuilder: (child, anim) {
        switch (direction) {
          case 'left':
            return SlideTransition(position: Tween(begin: const Offset(0.15,0), end: Offset.zero).animate(anim), child: child);
          case 'right':
            return SlideTransition(position: Tween(begin: const Offset(-0.15,0), end: Offset.zero).animate(anim), child: child);
          case 'up':
            return SlideTransition(position: Tween(begin: const Offset(0,0.15), end: Offset.zero).animate(anim), child: child);
          case 'down':
            return SlideTransition(position: Tween(begin: const Offset(0,-0.15), end: Offset.zero).animate(anim), child: child);
          case 'rotate':
            return RotationTransition(turns: Tween(begin: .98, end: 1.0).animate(anim), child: FadeTransition(opacity: anim, child: child));
          default:
            return ScaleTransition(scale: Tween(begin: .98, end: 1.0).animate(anim), child: FadeTransition(opacity: anim, child: child));
        }
      },
      child: KeyedSubtree(key: ValueKey(direction), child: child),
    );
  }
}
