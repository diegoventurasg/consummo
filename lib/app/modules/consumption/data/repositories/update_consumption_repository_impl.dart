import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../../domain/entities/consumption_entity.dart';
import '../../domain/repositories/update_consumption_repository.dart';
import '../datasources/update_consumption_datasource.dart';

class UpdateConsumptionRepositoryImpl implements IUpdateConsumptionRepository {
  final IUpdateConsumptionDatasource datasource;

  UpdateConsumptionRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, bool>> updateConsumption(
      ConsumptionEntity consumption) async {
    try {
      final result = await datasource(consumption);
      return result ? right(result) : left(DatasourceNull());
    } catch (e) {
      return left(InternalError());
    }
  }
}
