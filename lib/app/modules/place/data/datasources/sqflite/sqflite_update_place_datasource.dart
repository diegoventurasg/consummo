import '../../../../../core/data/storages/sqflite/repositories/place_repository.dart';
import '../../../domain/entities/place_entity.dart';
import '../update_place_datasource.dart';

class SqfliteUpdatePlaceDatasource implements IUpdatePlaceDatasource {
  final PlaceRepositoryDao db;

  SqfliteUpdatePlaceDatasource(this.db);

  @override
  Future<bool> call(PlaceEntity place) async {
    return await db.update({"id": place.id, "name": place.name});
  }
}
