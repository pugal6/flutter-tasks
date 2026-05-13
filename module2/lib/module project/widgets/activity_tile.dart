import 'package:flutter/material.dart';

import '../models/activity_log.dart';

class ActivityTile extends StatelessWidget {
  final ActivityLog activity;

  const ActivityTile({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:
            const Icon(Icons.notifications),
        title: Text(activity.message),
        subtitle: Text(
          '${activity.timestamp.hour}:${activity.timestamp.minute.toString().padLeft(2, '0')}',
        ),
      ),
    );
  }
}