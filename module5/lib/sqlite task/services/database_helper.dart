import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();

    return _database!;
  }

  static Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, 'app_database.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            completed INTEGER
          )
        ''');

        await db.execute('''
          CREATE TABLE journals(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            entry TEXT
          )
        ''');

        await db.insert('tasks', {
          'title': 'Complete Flutter assignment',
          'completed': 0,
        });

        await db.insert('tasks', {
          'title': 'Practice SQLite queries',
          'completed': 0,
        });

        await db.insert('tasks', {
          'title': 'Read sqflite documentation',
          'completed': 0,
        });
      },
    );
  }
}