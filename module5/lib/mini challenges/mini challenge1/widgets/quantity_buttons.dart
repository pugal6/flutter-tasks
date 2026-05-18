import 'package:flutter/material.dart';

class QuantityButtons extends StatelessWidget {
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const QuantityButtons({
    super.key,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _button(Icons.remove, onDecrease),
        const SizedBox(width: 8),
        _button(Icons.add, onIncrease),
      ],
    );
  }

  Widget _button(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.indigo.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon),
      ),
    );
  }
}