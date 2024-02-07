import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'user_model.dart'; // Import your User model class

class DatabaseHelper {
  static const _databaseName = "myDatabase.db";
  static const _databaseVersion = 1;
  static const table = 'users';

  static const columnId = 'id';
  static const columnEmail = 'email';
  static const columnPassword = 'password';
  static const columnName = 'name';
  static const columnAddress = 'address';

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only have a single app-wide reference to the database.
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  // open the database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT NOT NULL,
        $columnEmail TEXT NOT NULL,
        $columnPassword TEXT NOT NULL,
        $columnAddress TEXT NOT NULL
      )
    ''');
  }

  // Method to insert a user
  Future<void> insertUser(User user) async {
    Database db = await instance.database;
    await db.insert(
      table,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Method to retrieve all users
  Future<List<User>> getUsers() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(table);

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i][columnId],
        email: maps[i][columnEmail],
        password: maps[i][columnPassword],
        name: maps[i][columnName],
        address: maps[i][columnAddress],
      );
    });
  }

  // Add methods for updating and deleting users as needed
}
