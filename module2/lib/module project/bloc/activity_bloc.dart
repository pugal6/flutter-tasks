import 'dart:async';

import '../models/activity_log.dart';

class ActivityBloc {
  final List<ActivityLog> _activities = [];

  final StreamController<List<ActivityLog>>
      _controller = StreamController.broadcast();

  Stream<List<ActivityLog>> get activityStream =>
      _controller.stream;

  void addActivity(String message) {
    _activities.insert(
      0,
      ActivityLog(
        message: message,
        timestamp: DateTime.now(),
      ),
    );

    _controller.sink.add(_activities);
  }

  void dispose() {
    _controller.close();
  }
}