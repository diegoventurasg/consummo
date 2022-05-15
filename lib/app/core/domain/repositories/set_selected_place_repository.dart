import 'package:dartz/dartz.dart';

import '../entities/selected_place_entity.dart';
import '../errors/errors.dart';

abstract class ISetSelectedPlaceRepository {
  Future<Either<Failure, bool>> setSelectedPlace(SelectedPlaceEntity place);
}
