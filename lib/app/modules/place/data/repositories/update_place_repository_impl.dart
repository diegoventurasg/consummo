import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../../domain/entities/place_entity.dart';
import '../../domain/repositories/update_place_repository.dart';
import '../datasources/update_place_datasource.dart';

class UpdatePlaceRepositoryImpl implements IUpdatePlaceRepository {
  final IUpdatePlaceDatasource datasource;

  UpdatePlaceRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, bool>> updatePlace(PlaceEntity place) async {
    try {
      final result = await datasource(place);
      return result ? right(result) : left(InternalError());
    } catch (e) {
      return left(InternalError());
    }
  }
}
