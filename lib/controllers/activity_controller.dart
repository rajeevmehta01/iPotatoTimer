import 'package:ipotatotimer/database/database_config.dart';
import 'package:ipotatotimer/models/activity_model.dart';
import 'package:sqflite/sqflite.dart';

class ActivityController{
  DatabaseConfig databaseConfig = DatabaseConfig();

  /// Get all activity from database
  Future<List<Activity>> index() async {
    Database db = await databaseConfig.getDatabase();
    List<Map<String,dynamic>> maps = await db.query("activity", orderBy: 'id ASC');
    return List.generate(maps.length, (index) {
      return Activity(maps[index]["id"], maps[index]["name"], maps[index]["discription"], maps[index]["timestamp"], maps[index]["isCompleted"]);
    });
  }

  // Insert all activities from database(task table)
  Future<bool> store(Activity activity) async{
    Database db = await databaseConfig.getDatabase();
    bool success = false;
    try {
      await db.insert("activity", activity.toMap());
      success = true;
    } catch (error) {
      success = false;
    }
    return success;
  }

  /// Delete activity from database
  Future datete(int activityId) async {
    Database db = await databaseConfig.getDatabase();
    await db.delete("activity", where: 'id = ?', whereArgs: [activityId]);
  }

}