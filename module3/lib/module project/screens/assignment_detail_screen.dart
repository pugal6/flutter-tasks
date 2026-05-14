import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/dummy_data.dart';
import '../providers/assignment_provider.dart';

import 'submit_assignment_screen.dart';

class AssignmentDetailScreen extends StatelessWidget {
  final String assignmentId;

  const AssignmentDetailScreen({super.key, required this.assignmentId});

  @override
  Widget build(BuildContext context) {
    final assignment = assignments.firstWhere((a) => a.id == assignmentId);

    final provider = Provider.of<AssignmentProvider>(context);

    final submitted = provider.isSubmitted(assignment.id);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 260,
              width: double.infinity,

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: submitted
                      ? [Colors.green, Colors.teal]
                      : [Colors.deepPurple, Colors.indigo],
                ),

                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),

                      const Spacer(),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white24,

                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Text(
                          submitted ? 'Submitted' : 'Pending',

                          style: const TextStyle(color: Colors.white),
                        ),
                      ),

                      const SizedBox(height: 18),

                      Text(
                        assignment.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Due: ${assignment.dueDate}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    assignment.course,
                    style: TextStyle(
                      color: Colors.indigo.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Assignment Overview',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 14),

                  Text(
                    assignment.description,
                    style: const TextStyle(fontSize: 16, height: 1.6),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'Requirements',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  ...assignment.requirements.map((requirement) {
                    return buildRequirement(requirement);
                  }),

                  const SizedBox(height: 30),

                  Container(
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: submitted
                          ? Colors.green.shade50
                          : Colors.orange.shade50,

                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Row(
                      children: [
                        Icon(
                          submitted ? Icons.check_circle : Icons.pending,

                          color: submitted ? Colors.green : Colors.orange,
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Text(
                            submitted
                                ? 'Assignment successfully submitted.'
                                : 'Submission pending.',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: submitted
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SubmitAssignmentScreen(
                                    assignment: assignment,
                                  ),
                                ),
                              );
                            },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: submitted
                            ? Colors.grey
                            : Colors.indigo,

                        foregroundColor: Colors.white,

                        padding: const EdgeInsets.all(18),
                      ),

                      child: Text(
                        submitted ? 'Already Submitted' : 'Submit Assignment',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRequirement(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),

      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.indigo),

          const SizedBox(width: 10),

          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
