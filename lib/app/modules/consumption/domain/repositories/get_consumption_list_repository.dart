import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/consumption_entity.dart';

abstract class IGetConsumptionListRepository {
  Future<Either<Failure, List<ConsumptionEntity>>> getConsumptionList(
      int userId);
}
