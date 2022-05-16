import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static _initDatabase() async {
    try {
      String path = join(
          await getDatabasesPath(), DatabaseHelperEnum.getValue(DATABASE.name));
      return await openDatabase(
        path,
        version: DatabaseHelperEnum.getValue(DATABASE.version),
        onCreate: _onCreate,
        onConfigure: _onConfigure,
      );
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static Future _onCreate(Database db, int version) async {
    var sql = [
      '''create table if not exists ''' +
          DatabaseHelperEnum.getValue(DATABASE.tableUser) +
          '''(
            id integer primary key autoincrement,
            name text,
            selected_place integer,
            FOREIGN KEY (selected_place) REFERENCES place (id) ON DELETE SET NULL
            );''',
      '''create table if not exists ''' +
          DatabaseHelperEnum.getValue(DATABASE.tablePlace) +
          '''(
            id integer primary key autoincrement,
            name text,
            user_id integer,
            FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
            );''',
      '''create table if not exists ''' +
          DatabaseHelperEnum.getValue(DATABASE.tableConsumption) +
          '''(
            id integer primary key autoincrement,
            name text,
            unit text,
            color int,
            user_id integer,
            FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
            );''',
      '''create table if not exists ''' +
          DatabaseHelperEnum.getValue(DATABASE.tablePeriod) +
          '''(
            id integer primary key autoincrement,
            place_id integer,
            consumption_id integer,
            closed integer default 0,
            FOREIGN KEY (place_id) REFERENCES place (id) ON DELETE CASCADE,
            FOREIGN KEY (consumption_id) REFERENCES consumption (id) ON DELETE CASCADE
      );''',
      '''create table if not exists ''' +
          DatabaseHelperEnum.getValue(DATABASE.tableRecord) +
          '''(
            id integer primary key autoincrement,
            value real,
            date text,
            period_id integer,
            FOREIGN KEY (period_id) REFERENCES period (id)
      );''',
      /*'''insert into ''' +
          DatabaseHelperEnum.getValue(DATABASE.tableConsumption) +
          '''(name, unit) values ('Água', 'm³'), ('Luz', 'kWh');''',*/
    ];

    for (var i = 0; i < sql.length; i++) {
      await db.execute(sql[i]).catchError((onError) {
        if (kDebugMode) {
          print(onError);
        }
      });
    }
  }
}

enum DATABASE {
  name,
  version,
  tableUser,
  tablePlace,
  tableConsumption,
  tableRecord,
  tablePeriod,
}

class DatabaseHelperEnum {
  static dynamic getValue(DATABASE databaseName) {
    switch (databaseName) {
      case DATABASE.name:
        return "consummo.db";
      case DATABASE.version:
        return 1;
      case DATABASE.tableUser:
        return "user";
      case DATABASE.tablePlace:
        return "place";
      case DATABASE.tableConsumption:
        return "consumption";
      case DATABASE.tableRecord:
        return "record";
      case DATABASE.tablePeriod:
        return "period";
      default:
        return "";
    }
  }
}
