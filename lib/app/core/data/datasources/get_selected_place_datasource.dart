import '../../domain/entities/selected_place_entity.dart';

abstract class IGetSelectedPlaceDatasource {
  Future<SelectedPlaceEntity?> call(int userId);
}
