import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../../domain/entities/consumption_entity.dart';
import '../../domain/repositories/get_consumption_list_repository.dart';
import '../datasources/get_consumption_list_datasource.dart';

class GetConsumptionListRepositoryImpl
    implements IGetConsumptionListRepository {
  final IGetConsumptionListDatasource datasource;

  GetConsumptionListRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<ConsumptionEntity>>> getConsumptionList(
    int userId,
  ) async {
    try {
      final list = await datasource(userId);
      return list == null ? left(DatasourceNull()) : right(list);
    } catch (e) {
      return left(InternalError());
    }
  }
}
