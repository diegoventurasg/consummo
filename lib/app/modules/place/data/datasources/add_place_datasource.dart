import '../../domain/entities/place_entity.dart';

abstract class IAddPlaceDatasource {
  Future<int?> call(PlaceEntity place);
}
