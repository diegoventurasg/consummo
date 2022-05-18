import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../database.dart';

abstract class IConsumptionRepositoryDao {
  Future<Map<String, dynamic>?> get(int id);
  Future<List<Map<String, dynamic>>?> getByUserId(int id);
  Future<int?> insert(Map<String, dynamic> row);
  Future<bool> update(Map<String, dynamic> row);
  Future<bool> delete(int id);
}

class ConsumptionRepositoryDao implements IConsumptionRepositoryDao {
  static final _table = DatabaseHelperEnum.getValue(DATABASE.tableConsumption);
  Future<Database?> database;

  ConsumptionRepositoryDao({required this.database});

  @override
  Future<Map<String, dynamic>?> get(id) async {
    final Database db = (await database)!;
    try {
      List<Map<String, dynamic>> maps = await db.query(
        _table,
        columns: ["id", "name", "unit"],
        where: 'id = ?',
        whereArgs: [id],
      );

      if (maps.isNotEmpty) maps.first;
    } catch (error) {
      if (kDebugMode) print(error);
    }

    return null;
  }

  @override
  Future<List<Map<String, dynamic>>?> getByUserId(userId) async {
    final Database db = (await database)!;
    try {
      final consumptions = await db.query(
        _table,
        columns: ["id", "name", "unit", "color", "user_id"],
        where: "user_id=?",
        whereArgs: [userId],
        orderBy: "name",
      );

      return consumptions;
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
  Future<bool> delete(id) async {
    final Database db = (await database)!;
    try {
      int count = await db.delete(
        _table,
        where: 'id = ?',
        whereArgs: [id],
      );
      return count > 0;
    } catch (error) {
      if (kDebugMode) print(error);
    }
    return false;
  }
}
