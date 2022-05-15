import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/place_entity.dart';
import '../repositories/add_place_repository.dart';

abstract class IAddPlaceUseCase {
  Future<Either<Failure, int>> call(PlaceEntity place);
}

class AddPlaceUseCaseImpl implements IAddPlaceUseCase {
  final IAddPlaceRepository repository;

  AddPlaceUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, int>> call(PlaceEntity place) async {
    return repository.addPlace(place);
  }
}
