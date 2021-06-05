import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    required this.layouts,
  });

  final List<ResponsiveLayout> layouts;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return layouts
          .firstWhere((layout) => layout.constraint(constraints),
              orElse: () => ResponsiveLayout(
                    constraint: catchAll(),
                    builder: (context) => Container(),
                  ))
          .builder(context);
    });
  }
}

typedef ConstraintCallback = bool Function(BoxConstraints constraints);

class ResponsiveLayout {
  const ResponsiveLayout({
    required this.constraint,
    required this.builder,
  });

  final ConstraintCallback constraint;
  final WidgetBuilder builder;
}

ConstraintCallback upTo(double limit) =>
    (constraints) => constraints.maxWidth < limit;

ConstraintCallback downTo(double limit) => (constraints) {
      return constraints.maxWidth > limit;
    };

ConstraintCallback catchAll() => (_) => true;
