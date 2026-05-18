import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';

class JournalDatabaseService {
  static Future<void> addEntry(String entry) async {
    final Database db = await DatabaseHelper.database;

    await db.insert(
      'journals',
      {
        'entry': entry,
      },
    );
  }

  static Future<List<Map<String, dynamic>>> getEntries() async {
    final Database db = await DatabaseHelper.database;

    return await db.query(
      'journals',
      orderBy: 'id DESC',
    );
  }
}