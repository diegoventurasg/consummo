import '../../../domain/entities/selected_place_entity.dart';
import '../../storages/sqflite/repositories/user_repository.dart';
import '../set_selected_place_datasource.dart';

class SqfliteSetSelectedPlaceDatasource implements ISetSelectedPlaceDatasource {
  final UserRepositoryDao db;

  SqfliteSetSelectedPlaceDatasource(this.db);

  @override
  Future<bool> call(SelectedPlaceEntity place) async {
    bool result = await db.updateSelectedPlace(
      placeId: place.id,
      userId: place.userId,
    );

    return result;
  }
}
