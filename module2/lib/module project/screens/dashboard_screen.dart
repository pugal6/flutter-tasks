import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../providers/workspace_provider.dart';
import '../widgets/activity_tile.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/status_section.dart';
import '../widgets/workspace_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workspaceProvider =
        Provider.of<WorkspaceProvider>(context);

    final themeProvider =
        Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Workspace'),
        actions: [
          Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const DashboardHeader(),

            const SizedBox(height: 20),

            StatusSection(
              available:
                  workspaceProvider.availableCount,
              reserved:
                  workspaceProvider.reservedCount,
              inUse:
                  workspaceProvider.inUseCount,
            ),

            const SizedBox(height: 24),

            const Text(
              'Workspace Status',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            GridView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              itemCount:
                  workspaceProvider.workspaces.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                final workspace =
                    workspaceProvider
                        .workspaces[index];

                return WorkspaceCard(
                  workspace: workspace,
                  onTap: () {
                    workspaceProvider
                        .toggleWorkspace(
                      workspace,
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 24),

            const Text(
              'Live Activity',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            StreamBuilder(
              stream: workspaceProvider
                  .activityBloc
                  .activityStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text(
                    'No activity yet',
                  );
                }

                final activities =
                    snapshot.data!;

                return ListView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(),
                  itemCount: activities.length,
                  itemBuilder: (context, index) {
                    return ActivityTile(
                      activity:
                          activities[index],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}