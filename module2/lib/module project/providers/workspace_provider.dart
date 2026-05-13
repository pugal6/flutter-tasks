import 'package:flutter/material.dart';

import '../bloc/activity_bloc.dart';
import '../models/workspace.dart';

class WorkspaceProvider extends ChangeNotifier {
  final ActivityBloc activityBloc = ActivityBloc();

  final List<Workspace> workspaces = [
    Workspace(
      name: 'Meeting Room A',
      icon: Icons.meeting_room,
      status: 'Available',
    ),
    Workspace(
      name: 'Work  Desk 1',
      icon: Icons.desktop_windows,
      status: 'Reserved',
    ),
    Workspace(
      name: 'Projector',
      icon: Icons.video_call,
      status: 'In Use',
    ),
    Workspace(
      name: 'Conference Hall',
      icon: Icons.groups,
      status: 'Available',
    ),
  ];

  void toggleWorkspace(Workspace workspace) {
  if (workspace.status == 'Available') {
    workspace.status = 'Reserved';

    activityBloc.addActivity(
      '${workspace.name} Reserved',
    );
  } else if (workspace.status == 'Reserved') {
    workspace.status = 'In Use';

    activityBloc.addActivity(
      '${workspace.name} In Use',
    );
  } else {
    workspace.status = 'Available';

    activityBloc.addActivity(
      '${workspace.name} Released',
    );
  }

  notifyListeners();
}

  int get availableCount {
    return workspaces
        .where(
          (workspace) =>
              workspace.status == 'Available',
        )
        .length;
  }

  int get reservedCount {
    return workspaces
        .where(
          (workspace) =>
              workspace.status == 'Reserved',
        )
        .length;
  }

  int get inUseCount {
    return workspaces
        .where(
          (workspace) =>
              workspace.status == 'In Use',
        )
        .length;
  }
}