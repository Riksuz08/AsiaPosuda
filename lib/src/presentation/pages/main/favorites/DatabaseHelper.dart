import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../products/CartItem.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB('cart_database.db'); // Use 'cart_database.db' instead of 'notes.db'
    return _database!;
  }

  Future<Database> initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart_items(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productId INTEGER,
        productName TEXT,
        imageUrl TEXT,
        price TEXT,
        quantity INTEGER
      )
    ''');
  }

  Future<int> insertCartItem(CartItem cartItem) async {
    final db = await database;
    return db.insert('cart_items', cartItem.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<void> clearCart() async {
    final db = await database;
    await db.delete('cart_items');
  }
  Future<void> updateCartItemQuantity(int productId, int quantity) async {
    final db = await database;
    await db.rawUpdate(
      'UPDATE cart_items SET quantity = ? WHERE productId = ?',
      [quantity, productId],
    );
  }
  Future<void> deleteCartItem(int productId) async {
    final db = await database;
    await db.delete(
      'cart_items',
      where: 'productId = ?',
      whereArgs: [productId],
    );
  }
  Future<List<CartItem>> getCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('cart_items');
    return List.generate(maps.length, (i) => CartItem.fromMap(maps[i]));
  }
}
