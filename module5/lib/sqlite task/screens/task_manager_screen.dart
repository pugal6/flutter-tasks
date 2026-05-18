import 'package:flutter/material.dart';
import '../services/task_database_service.dart';

class TaskManagerScreen extends StatefulWidget {
  const TaskManagerScreen({super.key});

  @override
  State<TaskManagerScreen> createState() =>
      _TaskManagerScreenState();
}

class _TaskManagerScreenState
    extends State<TaskManagerScreen> {
  List<Map<String, dynamic>> tasks = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    final loadedTasks =
        await TaskDatabaseService.getTasks();

    setState(() {
      tasks = loadedTasks;
    });
  }

  Future<void> toggleTask(int index) async {
    final task = tasks[index];

    final updated =
        task['completed'] == 1 ? false : true;

    await TaskDatabaseService.updateTask(
      task['id'],
      updated,
    );

    loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    final completedTasks = tasks
        .where((task) => task['completed'] == 1)
        .length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.indigo,
                    Colors.deepPurple,
                  ],
                ),
                borderRadius:
                    BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Completed',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        '$completedTasks / ${tasks.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 52,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];

                  final completed =
                      task['completed'] == 1;

                  return AnimatedContainer(
                    duration:
                        const Duration(milliseconds: 300),
                    margin:
                        const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: completed
                          ? Colors.green.shade50
                          : Colors.white,
                      borderRadius:
                          BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.05,
                          ),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.all(18),
                      onTap: () => toggleTask(index),
                      leading: CircleAvatar(
                        backgroundColor: completed
                            ? Colors.green
                            : Colors.indigo,
                        child: Icon(
                          completed
                              ? Icons.check
                              : Icons.pending,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        task['title'],
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          decoration: completed
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      subtitle: Padding(
                        padding:
                            const EdgeInsets.only(top: 6),
                        child: Text(
                          completed
                              ? 'Completed'
                              : 'Pending',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}