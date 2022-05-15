import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/place_entity.dart';

abstract class IUpdatePlaceRepository {
  Future<Either<Failure, bool>> updatePlace(PlaceEntity place);
}
