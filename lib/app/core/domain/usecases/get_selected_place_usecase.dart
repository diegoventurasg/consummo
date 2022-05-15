import 'package:dartz/dartz.dart';

import '../entities/selected_place_entity.dart';
import '../errors/errors.dart';
import '../repositories/get_selected_place_repository.dart';

abstract class IGetSelectedPlaceUseCase {
  Future<Either<Failure, SelectedPlaceEntity>> call(int userId);
}

class GetSelectedPlaceUseCaseImpl implements IGetSelectedPlaceUseCase {
  final IGetSelectedPlaceRepository repository;

  GetSelectedPlaceUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, SelectedPlaceEntity>> call(int userId) {
    return repository.getSelectedPlace(userId);
  }
}
