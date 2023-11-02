import 'package:flutter/material.dart';

class PageConfig {
  final IconData icon;
  final String name;
  final Widget child;

  const PageConfig({
    required this.icon,
    required this.name,
    Widget? child,
  }) : child = child ?? const Placeholder();
}
