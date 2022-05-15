import 'package:dartz/dartz.dart';

import '../entities/selected_place_entity.dart';
import '../errors/errors.dart';
import '../repositories/set_selected_place_repository.dart';

abstract class ISetSelectedPlaceUseCase {
  Future<Either<Failure, bool>> call(SelectedPlaceEntity place);
}

class SetSelectedPlaceUseCaseImpl implements ISetSelectedPlaceUseCase {
  final ISetSelectedPlaceRepository repository;

  SetSelectedPlaceUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(SelectedPlaceEntity place) {
    return repository.setSelectedPlace(place);
  }
}
