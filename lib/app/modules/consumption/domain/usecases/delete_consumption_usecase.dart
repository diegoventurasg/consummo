import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../repositories/delete_consumption_repository.dart';

abstract class IDeleteConsumptionUseCase {
  Future<Either<Failure, bool>> call(int id);
}

class DeleteConsumptionUseCaseImpl implements IDeleteConsumptionUseCase {
  final IDeleteConsumptionRepository repository;

  DeleteConsumptionUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(int id) async {
    return repository.deleteConsumption(id);
  }
}
