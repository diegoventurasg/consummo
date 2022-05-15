import '../../domain/entities/place_entity.dart';

abstract class IGetPlaceListDatasource {
  Future<List<PlaceEntity>?> call(int userId);
}
