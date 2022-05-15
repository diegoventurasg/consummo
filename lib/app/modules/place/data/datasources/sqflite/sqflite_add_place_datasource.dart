import '../../../../../core/data/storages/sqflite/repositories/place_repository.dart';
import '../../../domain/entities/place_entity.dart';
import '../add_place_datasource.dart';

class SqfliteAddPlaceDatasource implements IAddPlaceDatasource {
  final PlaceRepositoryDao db;

  SqfliteAddPlaceDatasource(this.db);

  @override
  Future<int?> call(PlaceEntity place) async {
    return await db.insert({"name": place.name, "user_id": place.userId});
  }
}
