import '../../../../../core/data/storages/sqflite/repositories/place_repository.dart';
import '../delete_place_datasource.dart';

class SqfliteDeletePlaceDatasource implements IDeletePlaceDatasource {
  final PlaceRepositoryDao db;

  SqfliteDeletePlaceDatasource(this.db);

  @override
  Future<bool> call(int id) async {
    return await db.delete(id);
  }
}
