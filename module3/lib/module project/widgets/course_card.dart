import 'package:flutter/material.dart';

import '../models/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.course,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
                      color:
                          Colors.indigo.shade100,

                      borderRadius:
                          BorderRadius.circular(
                        20,
                      ),
                    ),

                    child: Text(
                      '${(course.progress * 100).toInt()}%',
                      style: const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),

                  const Icon(
                    Icons.bookmark_border,
                    size: 20,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Container(
                height: 52,
                width: 52,

                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,

                  borderRadius:
                      BorderRadius.circular(
                    14,
                  ),
                ),

                child: const Icon(
                  Icons.book,
                  color: Colors.indigo,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                course.title,
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
                course.instructor,
                maxLines: 1,
                overflow:
                    TextOverflow.ellipsis,

                style: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),

              const SizedBox(height: 18),

              LinearProgressIndicator(
                value: course.progress,
                minHeight: 8,

                borderRadius:
                    BorderRadius.circular(
                  20,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Continue Learning',
                style: TextStyle(
                  color: Colors.indigo.shade700,
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