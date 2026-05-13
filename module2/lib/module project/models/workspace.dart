import 'package:flutter/material.dart';

class Workspace {
  final String name;
  final IconData icon;
  String status;

  Workspace({
    required this.name,
    required this.icon,
    required this.status,
  });
}