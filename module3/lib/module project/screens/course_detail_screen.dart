import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class CourseDetailScreen extends StatelessWidget {
  final String courseId;

  const CourseDetailScreen({
    super.key,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    final course = courses.firstWhere(
      (c) => c.id == courseId,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 280,
              width: double.infinity,

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.indigo,
                    Colors.blue.shade400,
                  ],
                ),

                borderRadius:
                    const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },

                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),

                      const Spacer(),

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white24,

                          borderRadius:
                              BorderRadius.circular(
                            20,
                          ),
                        ),

                        child: const Text(
                          'Featured Course',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        course.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        'Instructor: ${course.instructor}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
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
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  const Text(
                    'Course Progress',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 18),

                  LinearProgressIndicator(
                    value: course.progress,
                    minHeight: 12,
                    borderRadius:
                        BorderRadius.circular(20),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    '${(course.progress * 100).toInt()}% Completed',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'About Course',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Text(
                    course.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'What You Will Learn',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  buildFeature(
                    Icons.check_circle,
                    'Build real projects',
                  ),

                  buildFeature(
                    Icons.check_circle,
                    'Understand core concepts',
                  ),

                  buildFeature(
                    Icons.check_circle,
                    'Practice assignments',
                  ),

                  buildFeature(
                    Icons.check_circle,
                    'Modern app development',
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: () {},

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
                        'Continue Learning',
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

  Widget buildFeature(
    IconData icon,
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 14,
      ),

      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.indigo,
          ),

          const SizedBox(width: 10),

          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}