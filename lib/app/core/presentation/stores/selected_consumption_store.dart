import 'package:mobx/mobx.dart';

import '../../domain/entities/selected_consumption_entity.dart';
import '../states/app_state.dart';
part 'selected_consumption_store.g.dart';

class SelectedConsumptionStore = _SelectedConsumptionStoreBase
    with _$SelectedConsumptionStore;

abstract class _SelectedConsumptionStoreBase with Store {
  @observable
  AppState state = AppState.empty();

  @action
  update(AppState value) => state = value;

  @action
  Future<void> set(SelectedConsumptionEntity consumption) async {
    update(AppState.success(consumption));
  }
}
