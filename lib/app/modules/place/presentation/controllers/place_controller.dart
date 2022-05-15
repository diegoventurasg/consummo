import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/presentation/controllers/app_controller.dart';
import '../../domain/entities/place_entity.dart';
import '../stores/place_store.dart';

part 'place_controller.g.dart';

class PlaceController = _PlaceControllerBase with _$PlaceController;

abstract class _PlaceControllerBase with Store {
  _PlaceControllerBase(this.store);

  final appController = Modular.get<AppController>();

  final PlaceStore store;

  @observable
  String? placeName;

  @action
  setPlaceName(String? value) => placeName = value;

  @computed
  bool get isFormValid => placeName != null && placeName!.trim().isNotEmpty;

  Future<void> save(int? placeId) async {
    final userId = appController.loggedInUser?.id ?? 0;
    if (userId != 0) {
      if (placeId == null) {
        //insert
        await store.addPlace(PlaceEntity(name: placeName!, userId: userId));
      } else {
        //update
        await store.updatePlace(
            PlaceEntity(id: placeId, name: placeName!, userId: userId));
      }
    }
  }

  Future<bool> delete(PlaceEntity place) async {
    final result = await store.deletePlace(place);
    return result;
  }
}
