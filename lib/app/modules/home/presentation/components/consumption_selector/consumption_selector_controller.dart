import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/presentation/controllers/app_controller.dart';
import '../../../../consumption/domain/entities/consumption_entity.dart';
import '../../../../consumption/presentation/stores/consumption_list_store.dart';

part 'consumption_selector_controller.g.dart';

class ConsumptionSelectorController = _ConsumptionSelectorControllerBase
    with _$ConsumptionSelectorController;

abstract class _ConsumptionSelectorControllerBase with Store {
  _ConsumptionSelectorControllerBase(this.consumptionListStore);

  final ConsumptionListStore consumptionListStore;
  ObservableList<ConsumptionEntity> consumptionList =
      ObservableList<ConsumptionEntity>();

  final appController = Modular.get<AppController>();

  Future<void> getConsumptionList() async {
    final userId = appController.loggedInUser!.id;
    await consumptionListStore.get(userId);
    consumptionList.clear();
    consumptionList.addAll(consumptionListStore.state.when(
      orElse: () => List<ConsumptionEntity>.empty(),
      success: (list) => list,
    ));
  }
}
