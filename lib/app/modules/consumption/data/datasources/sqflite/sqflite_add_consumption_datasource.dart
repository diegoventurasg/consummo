import '../../../../../core/data/storages/sqflite/repositories/consumption_repository.dart';
import '../../../domain/entities/consumption_entity.dart';
import '../../dtos/consumption_dto.dart';
import '../add_consumption_datasource.dart';

class SqfliteAddConsumptionDatasource implements IAddConsumptionDatasource {
  final ConsumptionRepositoryDao db;

  SqfliteAddConsumptionDatasource(this.db);

  @override
  Future<int?> call(ConsumptionEntity consumption) async {
    return await db.insert(consumption.toMap());
  }
}
