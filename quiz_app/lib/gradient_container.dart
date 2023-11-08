import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors, this.child});

  GradientContainer.purple({super.key, this.child})
      : colors = [
          const Color.fromRGBO(78, 13, 151, 1),
          const Color.fromRGBO(107, 15, 168, 1),
        ];

  final List<Color> colors;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
