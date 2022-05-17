import '../../domain/entities/consumption_entity.dart';

abstract class IAddConsumptionDatasource {
  Future<int?> call(ConsumptionEntity consumption);
}
