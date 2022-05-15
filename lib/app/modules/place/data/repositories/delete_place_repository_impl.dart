import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../../domain/repositories/delete_place_repository.dart';
import '../datasources/delete_place_datasource.dart';

class DeletePlaceRepositoryImpl implements IDeletePlaceRepository {
  final IDeletePlaceDatasource datasource;

  DeletePlaceRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, bool>> deletePlace(int id) async {
    try {
      final result = await datasource(id);
      return result ? right(result) : left(InternalError());
    } catch (e) {
      return left(InternalError());
    }
  }
}
