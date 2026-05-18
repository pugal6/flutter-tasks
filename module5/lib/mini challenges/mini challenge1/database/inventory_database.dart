import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/product_model.dart';

class InventoryDatabase {
  static final InventoryDatabase instance = InventoryDatabase._init();

  static Database? _database;

  InventoryDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('inventory.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        category TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertProduct(Product product) async {
    final db = await instance.database;

    return await db.insert(
      'products',
      product.toMap(),
    );
  }

  Future<List<Product>> getProducts() async {
    final db = await instance.database;

    final result = await db.query('products');

    return result.map((e) => Product.fromMap(e)).toList();
  }

  Future<int> updateProduct(Product product) async {
    final db = await instance.database;

    return db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<int> deleteProduct(int id) async {
    final db = await instance.database;

    return db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}