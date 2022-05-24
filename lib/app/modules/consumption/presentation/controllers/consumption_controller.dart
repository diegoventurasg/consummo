import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/presentation/controllers/app_controller.dart';
import '../../data/utils/color_list.dart';
import '../../data/utils/unit_list.dart';
import '../../domain/entities/consumption_entity.dart';
import '../stores/consumption_store.dart';

part 'consumption_controller.g.dart';

class ConsumptionController = _ConsumptionControllerBase
    with _$ConsumptionController;

abstract class _ConsumptionControllerBase with Store {
  _ConsumptionControllerBase(this.store);

  final appController = Modular.get<AppController>();

  final ConsumptionStore store;

  @observable
  String? name;

  @observable
  String? unit;

  @observable
  int? color;

  @action
  setName(String? value) => name = value?.trim();

  @action
  setUnit(String? value) {
    if (UnitList.list.contains(value)) {
      unit = value;
    } else {
      unit = null;
    }
  }

  @action
  setColor(int? value) {
    if (ColorList.list.contains(value)) {
      color = value;
    } else {
      color = null;
    }
  }

  setInitialValues(ConsumptionEntity? consumption) {
    setName(consumption?.name);
    setUnit(consumption?.unit);
    setColor(consumption?.color);
  }

  @computed
  bool get isNameValid => name != null && name!.trim().isNotEmpty;

  @computed
  bool get isUnitValid => unit != null;

  @computed
  bool get isColorValid => color != null;

  @computed
  bool get isFormValid => isNameValid && isUnitValid && isColorValid;

  Future<void> save(int? consumptionId) async {
    final userId = appController.loggedInUser?.id ?? 0;
    if (userId != 0) {
      if (consumptionId == null) {
        //insert
        await store.addConsumption(ConsumptionEntity(
          name: name!,
          userId: userId,
          color: color!,
          unit: unit!,
        ));
      } else {
        //update
        await store.updateConsumption(ConsumptionEntity(
          id: consumptionId,
          name: name!,
          userId: userId,
          color: color!,
          unit: unit!,
        ));
      }
    }
  }

  Future<bool> delete(ConsumptionEntity consumption) async {
    final result = await store.deleteConsumption(consumption);
    return result;
  }
}
