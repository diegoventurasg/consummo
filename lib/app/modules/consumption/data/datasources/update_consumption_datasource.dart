import '../../domain/entities/consumption_entity.dart';

abstract class IUpdateConsumptionDatasource {
  Future<bool> call(ConsumptionEntity consumption);
}
