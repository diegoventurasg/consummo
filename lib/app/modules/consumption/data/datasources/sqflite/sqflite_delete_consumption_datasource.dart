import '../../../../../core/data/storages/sqflite/repositories/consumption_repository.dart';
import '../../../domain/entities/consumption_entity.dart';
import '../../dtos/consumption_dto.dart';
import '../delete_consumption_datasource.dart';

class SqfliteDeleteConsumptionDatasource
    implements IDeleteConsumptionDatasource {
  final ConsumptionRepositoryDao db;

  SqfliteDeleteConsumptionDatasource(this.db);

  @override
  Future<bool> call(int id) async {
    return await db.delete(id);
  }
}
