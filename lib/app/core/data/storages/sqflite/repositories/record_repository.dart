import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../database.dart';

abstract class IRecordRepositoryDao {
  Future<Map<String, dynamic>?> get(int id);
  Future<List<Map<String, dynamic>>?> getByPeriod(int periodId);
  Future<int?> insert(Map<String, dynamic> row);
  Future<bool> update(Map<String, dynamic> row);
}

class RecordRepositoryDao implements IRecordRepositoryDao {
  static final _table = DatabaseHelperEnum.getValue(DATABASE.tableRecord);
  Future<Database?> database;

  RecordRepositoryDao({required this.database});

  @override
  Future<Map<String, dynamic>?> get(id) async {
    final Database db = (await database)!;
    try {
      List<Map<String, dynamic>> maps = await db.query(
        _table,
        columns: ["id", "value", "date", "place_id", "consumption_id"],
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
  Future<List<Map<String, dynamic>>?> getByPeriod(periodId) async {
    final Database db = (await database)!;
    try {
      List<Map<String, dynamic>> records = await db.query(
        _table,
        columns: ["id", "value", "date", "period_id"],
        where: "period_id=?",
        whereArgs: [periodId],
        orderBy: "date",
      );

      return records;
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
}
