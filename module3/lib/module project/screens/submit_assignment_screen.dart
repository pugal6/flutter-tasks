import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/assignment.dart';
import '../providers/assignment_provider.dart';

import 'submission_success_screen.dart';

class SubmitAssignmentScreen
    extends StatefulWidget {
  final Assignment assignment;

  const SubmitAssignmentScreen({
    super.key,
    required this.assignment,
  });

  @override
  State<SubmitAssignmentScreen>
      createState() =>
          _SubmitAssignmentScreenState();
}

class _SubmitAssignmentScreenState
    extends State<SubmitAssignmentScreen> {
  final TextEditingController notesController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assignment Submission',
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Container(
              padding: const EdgeInsets.all(
                20,
              ),

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.indigo,
                    Colors.blue.shade400,
                  ],
                ),

                borderRadius:
                    BorderRadius.circular(24),
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  const Icon(
                    Icons.upload_file,
                    color: Colors.white,
                    size: 40,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    widget.assignment.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Due: ${widget.assignment.dueDate}',
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Submission Notes',
              style: TextStyle(
                fontSize: 22,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: notesController,
              maxLines: 6,

              decoration: InputDecoration(
                hintText:
                    'Add notes about your submission...',

                filled: true,

                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                    20,
                  ),

                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(
                18,
              ),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                    BorderRadius.circular(
                  20,
                ),
              ),

              child: const Row(
                children: [
                  Icon(
                    Icons.info,
                    color: Colors.indigo,
                  ),

                  SizedBox(width: 14),

                  Expanded(
                    child: Text(
                      'Make sure all project requirements are completed before submission.',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  Provider.of<
                      AssignmentProvider>(
                    context,
                    listen: false,
                  ).submitAssignment(
                    widget.assignment.id,
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const SubmissionSuccessScreen(),
                    ),
                  );
                },

                style: ElevatedButton
                    .styleFrom(
                  backgroundColor:
                      Colors.indigo,

                  foregroundColor:
                      Colors.white,

                  padding:
                      const EdgeInsets.all(
                    18,
                  ),
                ),

                child: const Text(
                  'Submit Assignment',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}