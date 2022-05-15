import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../database.dart';

abstract class IPeriodRepositoryDao {
  Future<int?> insert(Map<String, dynamic> row);
  Future<List<Map<String, dynamic>>?> getCurrentPeriods({required int placeId});
  Future<Map<String, dynamic>?> getCurrentPeriod({
    required int placeId,
    required int consumptionId,
  });
}

class PeriodRepositoryDao implements IPeriodRepositoryDao {
  static final _table = DatabaseHelperEnum.getValue(DATABASE.tablePeriod);
  Future<Database?> database;

  PeriodRepositoryDao({required this.database});

  // Future<List<Map<String, dynamic>>?> _getRecords(
  //     Database db, int periodId) async {
  //   try {
  //     List<Map<String, dynamic>> records = await db.query(
  //       "record",
  //       columns: ["id", "value", "date", "period_id"],
  //       where: "period_id = ?",
  //       whereArgs: [periodId],
  //     );
  //     return records;
  //   } catch (error) {
  //     if (kDebugMode) print(error);
  //   }
  //   return null;
  // }

  @override
  Future<List<Map<String, dynamic>>?> getCurrentPeriods(
      {required int placeId}) async {
    final Database db = (await database)!;
    try {
      List<
          Map<String, dynamic>> periods = await db.rawQuery("select p.id,p.closed,"
              "p.place_id,p.consumption_id,c.name consumption_name,c.unit consumption_unit"
              " from period p"
              " join consumption c on (p.consumption_id = c.id)"
              " where p.place_id = " +
          placeId.toString() +
          " group by p.consumption_id" +
          " having max(p.id) = p.id");
      return periods;
    } catch (error) {
      if (kDebugMode) print(error);
    }
    return null;
  }

  @override
  Future<Map<String, dynamic>?> getCurrentPeriod({
    required int placeId,
    required int consumptionId,
  }) async {
    final Database db = (await database)!;
    try {
      List<
          Map<String, dynamic>> period = await db.rawQuery("select p.id,p.closed,"
              "p.place_id,p.consumption_id,c.name consumption_name,c.unit consumption_unit"
              " from period p"
              " join consumption c on (p.consumption_id = c.id)"
              " where p.place_id = " +
          placeId.toString() +
          " and p.consumption_id = " +
          consumptionId.toString());

      if (period.isNotEmpty) return period.first;
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
}
