import 'package:mobx/mobx.dart';

import '../../../../place/presentation/stores/place_list_store.dart';

part 'place_selector_controller.g.dart';

class PlaceSelectorController = _PlaceSelectorControllerBase
    with _$PlaceSelectorController;

abstract class _PlaceSelectorControllerBase with Store {
  _PlaceSelectorControllerBase(this.placeListStore);

  final PlaceListStore placeListStore;

  Future<void> getPlaceList(int userId) async {
    await placeListStore.get(userId);
  }
}
