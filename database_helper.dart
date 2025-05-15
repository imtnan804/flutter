import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('text_storage.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE texts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        content TEXT NOT NULL
      )
    ''');
  }

  Future<void> insertText(String content) async {
    final db = await database;
    await db.insert(
      'texts',
      {'content': content},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<String>> getAllTexts() async {
    final db = await database;
    final result = await db.query('texts');
    return result.map((e) => e['content'] as String).toList();
  }
}
