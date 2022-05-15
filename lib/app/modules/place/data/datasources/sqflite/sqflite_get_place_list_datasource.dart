import '../../../../../core/data/storages/sqflite/repositories/place_repository.dart';
import '../../../domain/entities/place_entity.dart';
import '../../dtos/place_dto.dart';
import '../get_place_list_datasource.dart';

class SqfliteGetPlaceListDatasource implements IGetPlaceListDatasource {
  final PlaceRepositoryDao db;

  SqfliteGetPlaceListDatasource(this.db);

  @override
  Future<List<PlaceEntity>?> call(int userId) async {
    final listMap = await db.getByUserId(userId);
    if (listMap == null) return null;

    final list = listMap.map((e) => PlaceDto.fromMap(e)).toList();
    return list;
  }
}
