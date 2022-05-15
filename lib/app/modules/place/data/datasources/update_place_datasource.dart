import '../../domain/entities/place_entity.dart';

abstract class IUpdatePlaceDatasource {
  Future<bool> call(PlaceEntity place);
}
