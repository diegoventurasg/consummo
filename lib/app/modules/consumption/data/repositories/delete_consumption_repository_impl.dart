import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../../domain/repositories/delete_consumption_repository.dart';
import '../datasources/delete_consumption_datasource.dart';

class DeleleConsumptionRepositoryImpl implements IDeleteConsumptionRepository {
  final IDeleteConsumptionDatasource datasource;

  DeleleConsumptionRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, bool>> deleteConsumption(int id) async {
    try {
      final result = await datasource(id);
      return result ? right(result) : left(DatasourceNull());
    } catch (e) {
      return left(InternalError());
    }
  }
}
