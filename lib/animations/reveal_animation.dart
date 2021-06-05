import 'package:basic_web_app/animations/absolute_slide_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum RevealType {
  OnlyFade,
  MoveIn,
  ScaleIn,
}

class RevealAnimation extends StatelessWidget {
  const RevealAnimation({
    required this.child,
    required this.animation,
    this.revealType = RevealType.MoveIn,
  });

  final Widget child;
  final Animation<double> animation;
  final RevealType revealType;

  Widget _animation() {
    switch (revealType) {
      case RevealType.ScaleIn:
        return ScaleTransition(
            scale: animation.drive(Tween(begin: 1.03, end: 1)), child: child);
      case RevealType.MoveIn:
        return AbsoluteSlideTransition(
            offset:
                animation.drive(Tween(begin: Offset(0, -10), end: Offset.zero)),
            child: child);
      case RevealType.OnlyFade:
        return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: animation.drive(Tween(begin: 0, end: 1)), child: _animation());
  }
}
