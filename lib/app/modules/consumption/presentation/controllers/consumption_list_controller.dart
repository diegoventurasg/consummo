import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/consumption_entity.dart';
import '../stores/consumption_list_store.dart';

part 'consumption_list_controller.g.dart';

class ConsumptionListController = _ConsumptionListControllerBase
    with _$ConsumptionListController;

abstract class _ConsumptionListControllerBase with Store {
  _ConsumptionListControllerBase(this.store);

  final ConsumptionListStore store;
  final GlobalKey<AnimatedListState> listKey = GlobalKey();
  ObservableList<ConsumptionEntity> consumptionList =
      ObservableList<ConsumptionEntity>();
  bool hasChanges = false;

  Future<void> get({required int userId}) async {
    await store.get(userId);
    consumptionList.clear();
    consumptionList.addAll(store.state.when(
      orElse: () => List<ConsumptionEntity>.empty(),
      success: (list) => list,
    ));
  }

  addItem(ConsumptionEntity item) {
    final index =
        consumptionList.lastIndexOf((e) => item.name.compareTo(e.name) > -1);
    consumptionList.insert(index + 1, item);
    listKey.currentState!.insertItem(consumptionList.length - 1);
    hasChanges = true;
  }

  deleteItem(int index, ConsumptionEntity item) async {
    consumptionList.removeAt(index);
    listKey.currentState!.removeItem(index, (_, __) => Container());
    hasChanges = true;
  }

  updateItem(int index, ConsumptionEntity item) {
    consumptionList[index] = item;
    hasChanges = true;
  }
}
