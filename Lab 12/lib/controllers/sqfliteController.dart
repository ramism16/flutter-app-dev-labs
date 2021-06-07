import 'package:madlab12/models/RandomNumber.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class sqfliteController{
  static Database database;

  static Future initialize() async {
    database = await openDatabase(
        join(await getDatabasesPath(), 'random_number.db'),
        onCreate: (db, version) {
        return db.execute('CREATE TABLE randomNumber(id INTEGER PRIMARY KEY, value INTEGER, timestamp INTEGER)',);
      },
      version: 1,
    );
  }

  static Future<void> insertInDB(RandomNumber randomNumber) async {
    await database.insert('randomNumber', randomNumber.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<RandomNumber>> getRandomNumbers() async{
    final List<Map<String, dynamic>> randomNumbersMaps = await database.query('randomNumber');
    return List.generate(randomNumbersMaps.length, (index) => RandomNumber.fromMap(randomNumbersMaps[index]));
  }

  static Future<void> updateDB(RandomNumber randomNumber) async {
    // '?' are arguments for where clause
    await database.update('randomNumber', randomNumber.toMap(), where: "id = ?", whereArgs: [randomNumber.id], conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> deleteFromDB(int id) async {
    await database.delete('randomNumber', where: "id = ?", whereArgs: [id]);
  }

  static Future<void> deleteAllRows() async {
    await database.delete('randomNumber');
  }

  static Future<void> closeDB() async {
    await database.close();
  }
}