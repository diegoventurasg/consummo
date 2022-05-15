import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/place_entity.dart';
import '../repositories/update_place_repository.dart';

abstract class IUpdatePlaceUseCase {
  Future<Either<Failure, bool>> call(PlaceEntity place);
}

class UpdatePlaceUseCaseImpl implements IUpdatePlaceUseCase {
  final IUpdatePlaceRepository repository;

  UpdatePlaceUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(PlaceEntity place) async {
    return repository.updatePlace(place);
  }
}
