import 'package:consummo/app/modules/consumption/domain/entities/consumption_entity.dart';

import '../../../../../core/data/storages/sqflite/repositories/consumption_repository.dart';
import '../../dtos/consumption_dto.dart';
import '../get_consumption_list_datasource.dart';

class SqfliteGetConsumptionListDatasource
    implements IGetConsumptionListDatasource {
  final ConsumptionRepositoryDao db;

  SqfliteGetConsumptionListDatasource(this.db);

  @override
  Future<List<ConsumptionEntity>?> call(int userId) async {
    final listMap = await db.getByUserId(userId);
    if (listMap == null) return null;

    final list = listMap.map((e) => ConsumptionDto.fromMap(e)).toList();
    return list;
  }
}
