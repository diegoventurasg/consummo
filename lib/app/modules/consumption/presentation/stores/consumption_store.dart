import 'package:mobx/mobx.dart';

import '../../../../core/presentation/states/app_state.dart';
import '../../domain/entities/consumption_entity.dart';
import '../../domain/usecases/add_consumption_usecase.dart';
import '../../domain/usecases/delete_consumption_usecase.dart';
import '../../domain/usecases/update_consumption_usecase.dart';
part 'consumption_store.g.dart';

class ConsumptionStore = _ConsumptionStoreBase with _$ConsumptionStore;

abstract class _ConsumptionStoreBase with Store {
  _ConsumptionStoreBase(
    this._addConsumptionUseCase,
    this._deleteConsumptionUseCase,
    this._updateConsumptionUseCase,
  );

  final IAddConsumptionUseCase _addConsumptionUseCase;
  final IDeleteConsumptionUseCase _deleteConsumptionUseCase;
  final IUpdateConsumptionUseCase _updateConsumptionUseCase;

  @observable
  AppState state = AppState.empty();

  @computed
  bool get isLoading => state.when(orElse: () => false, loading: () => true);

  @action
  update(AppState value) => state = value;

  @action
  Future<void> addConsumption(ConsumptionEntity consumption) async {
    update(AppState.loading());
    final result = await _addConsumptionUseCase(consumption);
    result.fold(
      (l) => update(AppState.error(l)),
      (r) => update(AppState.success<ConsumptionEntity>(ConsumptionEntity(
        id: r,
        name: consumption.name,
        userId: consumption.userId,
        unit: consumption.unit,
        color: consumption.color,
      ))),
    );
  }

  @action
  Future<void> updateConsumption(ConsumptionEntity consumption) async {
    update(AppState.loading());
    final result = await _updateConsumptionUseCase(consumption);
    result.fold(
      (l) => update(AppState.error(l)),
      (r) => update(AppState.success<ConsumptionEntity>(ConsumptionEntity(
        id: consumption.id,
        name: consumption.name,
        userId: consumption.userId,
        unit: consumption.unit,
        color: consumption.color,
      ))),
    );
  }

  @action
  Future<bool> deleteConsumption(ConsumptionEntity consumption) async {
    final result = await _deleteConsumptionUseCase(consumption.id!);
    return result.isRight();
  }
}
