import 'package:dartz/dartz.dart';

import '../../domain/entities/selected_place_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/get_selected_place_repository.dart';
import '../datasources/get_selected_place_datasource.dart';

class GetSelectedPlaceRepositoryImpl implements IGetSelectedPlaceRepository {
  final IGetSelectedPlaceDatasource datasource;

  GetSelectedPlaceRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, SelectedPlaceEntity>> getSelectedPlace(
      int userId) async {
    try {
      final place = await datasource(userId);
      return place == null ? left(DatasourceNull()) : right(place);
    } catch (e) {
      return left(InternalError());
    }
  }
}
