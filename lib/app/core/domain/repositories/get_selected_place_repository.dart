import 'package:dartz/dartz.dart';

import '../entities/selected_place_entity.dart';
import '../errors/errors.dart';

abstract class IGetSelectedPlaceRepository {
  Future<Either<Failure, SelectedPlaceEntity>> getSelectedPlace(int userId);
}
