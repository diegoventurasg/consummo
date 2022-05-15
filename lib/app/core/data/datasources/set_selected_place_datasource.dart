import '../../domain/entities/selected_place_entity.dart';

abstract class ISetSelectedPlaceDatasource {
  Future<bool> call(SelectedPlaceEntity place);
}
