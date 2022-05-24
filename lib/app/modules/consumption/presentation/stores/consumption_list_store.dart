import 'package:mobx/mobx.dart';

import '../../../../core/presentation/states/app_state.dart';
import '../../domain/usecases/get_consumption_list_usecase.dart';

part 'consumption_list_store.g.dart';

class ConsumptionListStore = _ConsumptionListStoreBase
    with _$ConsumptionListStore;

abstract class _ConsumptionListStoreBase with Store {
  _ConsumptionListStoreBase(this._getConsumptionListUseCase);

  final IGetConsumptionListUseCase _getConsumptionListUseCase;

  @observable
  AppState state = AppState.empty();

  @action
  void update(AppState value) => state = value;

  @action
  Future<void> get(int userId) async {
    update(AppState.loading());
    final result = await _getConsumptionListUseCase(userId);
    result.fold(
      (l) => update(AppState.error(l)),
      (r) => update(AppState.success(r)),
    );
  }
}
