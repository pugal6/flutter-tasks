import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/dummy_data.dart';
import '../widgets/assignment_tile.dart';

class AssignmentsScreen
    extends StatelessWidget {
  const AssignmentsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assignments',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          bottom: 20,
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),

              child: Container(
                padding: const EdgeInsets.all(
                  24,
                ),

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple,
                      Colors.indigo.shade400,
                    ],
                  ),

                  borderRadius:
                      BorderRadius.circular(
                    28,
                  ),
                ),

                child: const Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Assignments Tracker 📚',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Manage submissions, deadlines, and project tasks in one place.',
                      style: TextStyle(
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                'Your Tasks',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            GridView.builder(
              shrinkWrap: true,

              physics:
                  const NeverScrollableScrollPhysics(),

              padding:
                  const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              itemCount: assignments.length,

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,

                crossAxisSpacing: 16,
                mainAxisSpacing: 16,

                mainAxisExtent: 260,
              ),

              itemBuilder: (context, index) {
                final assignment =
                    assignments[index];

                return AssignmentTile(
                  assignment: assignment,
                  onTap: () {
                    context.pushNamed(
                      'assignment-detail',
                      pathParameters: {
                        'id': assignment.id,
                      },
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