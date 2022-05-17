import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/consumption_entity.dart';
import '../repositories/add_consumption_repository.dart';

abstract class IAddConsumptionUseCase {
  Future<Either<Failure, int>> call(ConsumptionEntity consumption);
}

class AddConsumptionUseCaseIml implements IAddConsumptionUseCase {
  final IAddConsumptionRepository repository;

  AddConsumptionUseCaseIml(this.repository);

  @override
  Future<Either<Failure, int>> call(ConsumptionEntity consumption) async {
    return repository.addConsumption(consumption);
  }
}
