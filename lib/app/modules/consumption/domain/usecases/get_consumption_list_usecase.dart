import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/consumption_entity.dart';
import '../repositories/get_consumption_list_repository.dart';

abstract class IGetConsumptionListUseCase {
  Future<Either<Failure, List<ConsumptionEntity>>> call(int userId);
}

class GetConsumptionUseCaseImpl implements IGetConsumptionListUseCase {
  final IGetConsumptionListRepository repository;

  GetConsumptionUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<ConsumptionEntity>>> call(int userId) async {
    return repository.getConsumptionList(userId);
  }
}
