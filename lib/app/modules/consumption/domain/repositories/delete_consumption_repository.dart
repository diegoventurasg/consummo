import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';

abstract class IDeleteConsumptionRepository {
  Future<Either<Failure, bool>> deleteConsumption(int id);
}
