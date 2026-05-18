import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';

class TaskDatabaseService {
  static Future<List<Map<String, dynamic>>> getTasks() async {
    final Database db = await DatabaseHelper.database;

    return await db.query('tasks');
  }

  static Future<void> updateTask(
    int id,
    bool completed,
  ) async {
    final Database db = await DatabaseHelper.database;

    await db.update(
      'tasks',
      {
        'completed': completed ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}