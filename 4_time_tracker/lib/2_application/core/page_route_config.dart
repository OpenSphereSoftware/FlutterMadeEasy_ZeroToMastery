import 'package:flutter/material.dart';

class PageRouteConfig {
  final IconData icon;
  final String key;
  final Widget child;

  const PageRouteConfig({
    required this.icon,
    required this.key,
    required this.child,
  });
}
