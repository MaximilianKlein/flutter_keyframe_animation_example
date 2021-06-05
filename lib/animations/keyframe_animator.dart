import 'dart:math';

import 'package:collection/collection.dart';

import 'package:flutter/material.dart';

class Keyframe<T> {
  const Keyframe({
    required this.key,
    required this.duration,
    required this.triggerOffset,
  });

  final Key key;
  final Duration duration;
  final Duration triggerOffset;
}

typedef KeyframeBuilder = Widget Function(BuildContext, Animation<double>);

class KeyframeAnimatedBuilder extends StatelessWidget {
  const KeyframeAnimatedBuilder({required this.key, required this.builder});

  final Key key;
  final KeyframeBuilder builder;

  @override
  Widget build(BuildContext context) {
    final keyframeAnimator = context
        .dependOnInheritedWidgetOfExactType<_KeyframeAnimatorInherited>();
    final keyframe = keyframeAnimator?.state.keyframeWithKey(key);
    if (keyframeAnimator == null || keyframe == null) {
      print(
          'could not find KeyframeAnimator in context make sure to wrap your keyframe animate');
      return Text('could not find KeyframeAnimator widget');
    } else {
      return AnimatedBuilder(
          animation: keyframeAnimator.state.animation,
          builder: (context, _) => builder(
              context,
              CurvedAnimation(
                parent: keyframeAnimator.state.animation,
                curve: Interval(
                    keyframe.triggerOffset.inMilliseconds /
                        keyframeAnimator.state.duration.inMilliseconds,
                    (keyframe.triggerOffset.inMilliseconds +
                            keyframe.duration.inMilliseconds) /
                        keyframeAnimator.state.duration.inMilliseconds),
              )));
    }
  }
}

class KeyframeAnimator extends StatefulWidget {
  const KeyframeAnimator({required this.keyframes, required this.child});

  final List<Keyframe> keyframes;
  final Widget child;

  @override
  _KeyframeAnimatorState createState() => _KeyframeAnimatorState();
}

class _KeyframeAnimatorState extends State<KeyframeAnimator>
    with TickerProviderStateMixin {
  late Duration duration = _calcDuration();
  late AnimationController _anim =
      AnimationController(vsync: this, duration: duration)..forward();

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  Animation<double> get animation => _anim;

  Duration _calcDuration() {
    return widget.keyframes.fold(
        Duration.zero,
        (prev, cur) => prev > cur.triggerOffset + cur.duration
            ? prev
            : cur.triggerOffset + cur.duration);
  }

  Keyframe? keyframeWithKey(Key key) {
    return widget.keyframes.firstWhereOrNull((element) => element.key == key);
  }

  @override
  Widget build(BuildContext context) {
    return _KeyframeAnimatorInherited(widget.child, this);
  }
}

class _KeyframeAnimatorInherited extends InheritedWidget {
  const _KeyframeAnimatorInherited(Widget child, this.state)
      : super(child: child);

  final _KeyframeAnimatorState state;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
