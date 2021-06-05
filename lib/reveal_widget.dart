import 'package:basic_web_app/animations/keyframe_animator.dart';
import 'package:basic_web_app/animations/reveal_animation.dart';
import 'package:flutter/material.dart';

class RevealWidget extends StatelessWidget {
  const RevealWidget({
    required this.key,
    required this.child,
    this.revealType = RevealType.MoveIn,
  });

  final Widget child;
  final Key key;
  final RevealType revealType;

  @override
  Widget build(BuildContext context) {
    return KeyframeAnimatedBuilder(
      key: key,
      builder: (context, animation) => RevealAnimation(
        animation: animation,
        child: child,
        revealType: revealType,
      ),
    );
  }
}
