import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../../domain/entities/consumption_entity.dart';
import '../../domain/repositories/add_consumption_repository.dart';
import '../datasources/add_consumption_datasource.dart';

class AddConsumptionRepositoryImpl implements IAddConsumptionRepository {
  final IAddConsumptionDatasource datasource;

  AddConsumptionRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, int>> addConsumption(
      ConsumptionEntity consumption) async {
    try {
      final result = await datasource(consumption);
      return result == null ? left(DatasourceNull()) : right(result);
    } catch (e) {
      return left(InternalError());
    }
  }
}
