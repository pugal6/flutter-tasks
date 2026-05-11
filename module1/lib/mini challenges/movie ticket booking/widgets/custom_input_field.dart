import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final IconData icon;

  const CustomInputField({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: Icon(icon),
      ),
    );
  }
}