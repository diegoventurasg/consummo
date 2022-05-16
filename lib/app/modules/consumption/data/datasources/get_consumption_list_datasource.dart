import '../../domain/entities/consumption_entity.dart';

abstract class IGetConsumptionListDatasource {
  Future<List<ConsumptionEntity>?> call(int userId);
}
