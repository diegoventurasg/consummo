import '../../../../../core/data/storages/sqflite/repositories/consumption_repository.dart';
import '../../../domain/entities/consumption_entity.dart';
import '../../dtos/consumption_dto.dart';
import '../update_consumption_datasource.dart';

class SqfliteUpdateConsumptionDatasource
    implements IUpdateConsumptionDatasource {
  final ConsumptionRepositoryDao db;

  SqfliteUpdateConsumptionDatasource(this.db);

  @override
  Future<bool> call(ConsumptionEntity consumption) async {
    return await db.update(consumption.toMap());
  }
}
