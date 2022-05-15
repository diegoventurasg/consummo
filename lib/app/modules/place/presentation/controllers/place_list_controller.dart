import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/place_entity.dart';
import '../stores/place_list_store.dart';

part 'place_list_controller.g.dart';

class PlaceListController = _PlaceListControllerBase with _$PlaceListController;

abstract class _PlaceListControllerBase with Store {
  _PlaceListControllerBase(
    this.store,
  );

  final PlaceListStore store;
  final GlobalKey<AnimatedListState> listKey = GlobalKey();
  ObservableList<PlaceEntity> placeList = ObservableList<PlaceEntity>();

  @observable
  bool isEditing = false;

  @action
  void toggleEditing() => isEditing = !isEditing;

  Future<void> get({required int userId}) async {
    await store.get(userId);
    placeList.clear();
    placeList.addAll(store.state.when(
      orElse: () => List.empty(),
      success: (list) => list,
    ));
  }

  addItem(PlaceEntity item) {
    final index =
        placeList.lastIndexWhere((e) => item.name.compareTo(e.name) > -1);
    placeList.insert(index + 1, item);
    listKey.currentState!.insertItem(placeList.length - 1);
  }

  deleteItem(int index, PlaceEntity item) async {
    placeList.removeAt(index);
    listKey.currentState!.removeItem(index, (_, animation) => Container());
  }

  updateItem(int index, PlaceEntity item) {
    placeList[index] = item;
  }
}
