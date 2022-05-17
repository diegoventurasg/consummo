import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/consumption_entity.dart';

abstract class IUpdateConsumptionRepository {
  Future<Either<Failure, bool>> updateConsumption(
      ConsumptionEntity consumption);
}
