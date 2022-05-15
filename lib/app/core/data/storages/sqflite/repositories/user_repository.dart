import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../database.dart';

abstract class IUserRepositoryDao {
  Future<Map<String, dynamic>?> get(int id);
  Future<List<Map<String, dynamic>>?> getAll();
  Future<int?> insert(Map<String, dynamic> row);
  Future<bool> update(Map<String, dynamic> row);
  Future<Map<String, dynamic>?> getSelectedPlace(int userId);
  Future<bool> updateSelectedPlace({required int placeId, required int userId});
}

class UserRepositoryDao implements IUserRepositoryDao {
  static final _table = DatabaseHelperEnum.getValue(DATABASE.tableUser);
  Future<Database?> database;

  UserRepositoryDao({required this.database});

  @override
  Future<Map<String, dynamic>?> get(id) async {
    final Database db = (await database)!;
    try {
      List<Map<String, dynamic>> maps = await db.query(
        "$_table",
        columns: ["id", "name"],
        where: 'id = ?',
        whereArgs: [id],
      );

      if (maps.isNotEmpty) return maps.first;
    } catch (error) {
      if (kDebugMode) print(error);
    }

    return null;
  }

  @override
  Future<List<Map<String, dynamic>>?> getAll() async {
    final Database db = (await database)!;
    try {
      List<Map<String, dynamic>> users = await db.query(
        _table,
        columns: ["id", "name"],
        orderBy: "name",
      );

      return users;
    } catch (error) {
      if (kDebugMode) print(error);
    }
    return null;
  }

  @override
  Future<int?> insert(row) async {
    final Database db = (await database)!;
    try {
      int id = await db.insert(
        _table,
        row,
      );
      return id;
    } catch (error) {
      if (kDebugMode) print(error);
    }
    return null;
  }

  @override
  Future<bool> update(row) async {
    final Database db = (await database)!;
    try {
      int count = await db.update(
        _table,
        row,
        where: 'id = ?',
        whereArgs: [row['id'] as int],
      );
      return count > 0;
    } catch (error) {
      if (kDebugMode) print(error);
    }
    return false;
  }

  @override
  Future<Map<String, dynamic>?> getSelectedPlace(int userId) async {
    final Database db = (await database)!;
    try {
      List<Map<String, dynamic>> maps = await db
          .rawQuery("select p.id as id,p.name as name,p.user_id as user_id"
              " from place p join user u on (p.id = u.selected_place)"
              " where u.id = $userId");

      if (maps.isNotEmpty) return maps.first;
    } catch (error) {
      if (kDebugMode) print(error);
    }

    return null;
  }

  @override
  Future<bool> updateSelectedPlace(
      {required int? placeId, required int userId}) async {
    final Database db = (await database)!;
    try {
      int count = await db.update(
        "user",
        {"selected_place": placeId},
        where: 'id = ?',
        whereArgs: [userId],
      );
      return count > 0;
    } catch (error) {
      if (kDebugMode) print(error);
    }
    return false;
  }
}
