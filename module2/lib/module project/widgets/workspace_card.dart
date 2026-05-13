import 'package:flutter/material.dart';

import '../models/workspace.dart';

class WorkspaceCard extends StatelessWidget {
  final Workspace workspace;
  final VoidCallback onTap;

  const WorkspaceCard({
    super.key,
    required this.workspace,
    required this.onTap,
  });

  Color getStatusColor() {
    switch (workspace.status) {
      case 'Available':
        return Colors.green;

      case 'Reserved':
        return Colors.orange;

      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration:
          const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(20),
        color:
            getStatusColor().withOpacity(0.12),
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            workspace.icon,
            size: 50,
            color: getStatusColor(),
          ),

          Text(
            workspace.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          Container(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: getStatusColor(),
              borderRadius:
                  BorderRadius.circular(30),
            ),
            child: Text(
              workspace.status,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),

          ElevatedButton(
            onPressed: onTap,
            child: Text(
              workspace.status == 'Available'
    ? 'Reserve'
    : workspace.status == 'Reserved'
        ? 'Start Use'
        : 'Release',
            ),
          ),
        ],
      ),
    );
  }
}