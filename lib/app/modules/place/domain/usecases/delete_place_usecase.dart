import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../repositories/delete_place_repository.dart';

abstract class IDeletePlaceUseCase {
  Future<Either<Failure, bool>> call(int id);
}

class DeletePlaceUseCaseImpl implements IDeletePlaceUseCase {
  final IDeletePlaceRepository repository;

  DeletePlaceUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(int id) async {
    return repository.deletePlace(id);
  }
}
