import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../../domain/entities/place_entity.dart';
import '../../domain/repositories/add_place_repository.dart';
import '../datasources/add_place_datasource.dart';

class AddPlaceRepositoryImpl implements IAddPlaceRepository {
  final IAddPlaceDatasource datasource;

  AddPlaceRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, int>> addPlace(PlaceEntity place) async {
    try {
      final result = await datasource(place);
      return result == null ? left(DatasourceNull()) : right(result);
    } catch (e) {
      return left(InternalError());
    }
  }
}
