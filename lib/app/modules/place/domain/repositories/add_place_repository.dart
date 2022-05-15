import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/place_entity.dart';

abstract class IAddPlaceRepository {
  Future<Either<Failure, int>> addPlace(PlaceEntity place);
}
