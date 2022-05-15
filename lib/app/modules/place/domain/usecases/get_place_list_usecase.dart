import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../entities/place_entity.dart';
import '../repositories/get_place_list_repository.dart';

abstract class IGetPlaceListUseCase {
  Future<Either<Failure, List<PlaceEntity>>> call(int userId);
}

class GetPlaceListUseCaseImpl implements IGetPlaceListUseCase {
  final IGetPlaceListRespository repository;

  GetPlaceListUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<PlaceEntity>>> call(int userId) async {
    return repository.getPlaceList(userId);
  }
}
