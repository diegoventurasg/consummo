import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/consumption_entity.dart';

abstract class IAddConsumptionRepository {
  Future<Either<Failure, int>> addConsumption(ConsumptionEntity consumption);
}
