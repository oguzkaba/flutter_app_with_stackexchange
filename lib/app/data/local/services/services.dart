import 'package:flutter_app_with_stackexchange/app/data/local/model/questions.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalServices {
  static Database? _database;
  static final _databaseName = "questions1.db";
  static final _databaseVersion = 1;
  static final table = "table1";
  static final columnId = 'id';
  static final columnTitle = 'title';

  LocalServices.createInstance();
  static final LocalServices instance = LocalServices.createInstance();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE $table (
    $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
    $columnTitle TEXT NOT NULL
  )
  ''');
  }

  Future<int> insert(LocalQuestionsModel model) async {
    Database? db = await instance.database;
    var res = await db!.insert(table, model.toMap());
    return res;
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    var res = await db!.query(table, orderBy: "$columnId DESC");
    return res;
  }

  Future<List<Map<String, Object?>>> clearTable() async {
    Database? db = await instance.database;
    return await db!.rawQuery("DELETE FROM $table");
  }
}
