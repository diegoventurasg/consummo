import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/place_entity.dart';

abstract class IGetPlaceListRespository {
  Future<Either<Failure, List<PlaceEntity>>> getPlaceList(int userId);
}
