import '../../../domain/entities/selected_place_entity.dart';
import '../../dtos/selected_place_dto.dart';
import '../../storages/sqflite/repositories/user_repository.dart';
import '../get_selected_place_datasource.dart';

class SqfliteGetSelectedPlaceDatasource implements IGetSelectedPlaceDatasource {
  final UserRepositoryDao db;

  SqfliteGetSelectedPlaceDatasource(this.db);

  @override
  Future<SelectedPlaceEntity?> call(int userId) async {
    final placeMap = await db.getSelectedPlace(userId);
    if (placeMap == null) return null;

    final place = SelectedPlaceDto.fromMap(placeMap);
    return place;
  }
}
