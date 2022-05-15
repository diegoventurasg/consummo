import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';

abstract class IDeletePlaceRepository {
  Future<Either<Failure, bool>> deletePlace(int id);
}
