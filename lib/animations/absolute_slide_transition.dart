import 'package:flutter/material.dart';

class AbsoluteSlideTransition extends StatelessWidget {
  const AbsoluteSlideTransition({
    required this.child,
    required this.offset,
    this.duration = const Duration(milliseconds: 200),
  });

  final Widget child;
  final Duration duration;
  final Animation<Offset> offset;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset.value,
      child: child,
    );
  }
}
