import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/assignment.dart';
import '../providers/assignment_provider.dart';

class AssignmentTile
    extends StatelessWidget {
  final Assignment assignment;
  final VoidCallback onTap;

  const AssignmentTile({
    super.key,
    required this.assignment,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<AssignmentProvider>(
      context,
    );

    final submitted =
        provider.isSubmitted(assignment.id);

    return Card(
      child: InkWell(
        borderRadius:
            BorderRadius.circular(20),

        onTap: onTap,

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            mainAxisSize: MainAxisSize.min,

            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),

                    decoration: BoxDecoration(
                      color: submitted
                          ? Colors.green.shade100
                          : Colors.orange.shade100,

                      borderRadius:
                          BorderRadius.circular(
                        20,
                      ),
                    ),

                    child: Text(
                      submitted
                          ? 'Done'
                          : 'Pending',
                    ),
                  ),

                  Icon(
                    submitted
                        ? Icons.check_circle
                        : Icons.pending,

                    color: submitted
                        ? Colors.green
                        : Colors.orange,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Container(
                height: 52,
                width: 52,

                decoration: BoxDecoration(
                  color: submitted
                      ? Colors.green.shade50
                      : Colors.orange.shade50,

                  borderRadius:
                      BorderRadius.circular(
                    14,
                  ),
                ),

                child: Icon(
                  submitted
                      ? Icons.task_alt
                      : Icons.assignment,

                  color: submitted
                      ? Colors.green
                      : Colors.orange,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                assignment.title,
                maxLines: 2,
                overflow:
                    TextOverflow.ellipsis,

                style: const TextStyle(
                  fontSize: 17,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Due: ${assignment.dueDate}',
                style: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),

              const SizedBox(height: 18),

              Text(
                submitted
                    ? 'Submitted Successfully'
                    : 'Open Assignment',

                style: TextStyle(
                  color: submitted
                      ? Colors.green
                      : Colors.indigo,

                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}