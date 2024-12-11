import 'package:flutter/material.dart';

class MenuEntity {
  final IconData icon;
  final String label;
  final String route;
  final bool external;

  MenuEntity({
    required this.icon,
    required this.label,
    required this.route,
    required this.external,
  });
}
