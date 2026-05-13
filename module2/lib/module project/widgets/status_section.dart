import 'package:flutter/material.dart';

class StatusSection extends StatelessWidget {
  final int available;
  final int reserved;
  final int inUse;

  const StatusSection({
    super.key,
    required this.available,
    required this.reserved,
    required this.inUse,
  });

  Widget buildStatusCard(
    String title,
    int count,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin:
            const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius:
              BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 6),
            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildStatusCard(
          'Available',
          available,
          Colors.green,
        ),
        buildStatusCard(
          'Reserved',
          reserved,
          Colors.orange,
        ),
        buildStatusCard(
          'In Use',
          inUse,
          Colors.red,
        ),
      ],
    );
  }
}