import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/consumption_entity.dart';
import '../repositories/update_consumption_repository.dart';

abstract class IUpdateConsumptionUseCase {
  Future<Either<Failure, bool>> call(ConsumptionEntity consumption);
}

class UpdateConsumptionUseCaseImpl implements IUpdateConsumptionUseCase {
  final IUpdateConsumptionRepository repository;

  UpdateConsumptionUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(ConsumptionEntity consumption) async {
    return repository.upadteConsumption(consumption);
  }
}
