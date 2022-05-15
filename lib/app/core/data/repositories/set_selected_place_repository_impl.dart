import 'package:dartz/dartz.dart';

import '../../domain/entities/selected_place_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/set_selected_place_repository.dart';
import '../datasources/set_selected_place_datasource.dart';

class SetSelectedPlaceRepositoryImpl implements ISetSelectedPlaceRepository {
  final ISetSelectedPlaceDatasource datasource;

  SetSelectedPlaceRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, bool>> setSelectedPlace(
      SelectedPlaceEntity place) async {
    try {
      final isPlaceSelected = await datasource(place);
      return isPlaceSelected ? right(isPlaceSelected) : left(InternalError());
    } catch (e) {
      return left(InternalError());
    }
  }
}
