import 'package:flutter/material.dart';

class SunShine extends StatelessWidget {
  final double radius;
  final Widget child;
  const SunShine({Key? key, required this.child, required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.white.withOpacity(0.1)),
      child: Center(child: child),
    );
  }
}
