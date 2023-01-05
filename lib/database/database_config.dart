import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConfig {
  /// Open database, and create database file.
  Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'app_database.db'),
      onCreate: (db, version) async {
        await createTable(db);
      },
      onOpen: (db) {},
      onUpgrade: (db, oldVersion, newVersion) async {},
      onDowngrade: (db, oldVersion, newVersion) async {},
      version: 1,
    );
  }

  /// Open database, and create database file.
  Future createTable(Database db) async {
    await db.execute(
        "CREATE TABLE IF NOT EXISTS activity ( id VARCHAR PRIMARY KEY, name VARCHAR, discription VARCHAR, timestamp INT,isCompleted INT)");
  }
}
