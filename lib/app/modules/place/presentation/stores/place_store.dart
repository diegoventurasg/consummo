import 'package:mobx/mobx.dart';

import '../../../../core/presentation/states/app_state.dart';
import '../../domain/entities/place_entity.dart';
import '../../domain/usecases/add_place_usecase.dart';
import '../../domain/usecases/delete_place_usecase.dart';
import '../../domain/usecases/update_place_usecase.dart';

part 'place_store.g.dart';

class PlaceStore = _PlaceStoreBase with _$PlaceStore;

abstract class _PlaceStoreBase with Store {
  _PlaceStoreBase(
    this._addPlaceUseCase,
    this._updatePlaceUseCase,
    this._deletePlaceUseCase,
  );

  final IAddPlaceUseCase _addPlaceUseCase;
  final IUpdatePlaceUseCase _updatePlaceUseCase;
  final IDeletePlaceUseCase _deletePlaceUseCase;

  @observable
  AppState state = AppState.empty();

  @computed
  bool get isLoading => state.when(orElse: () => false, loading: () => true);

  @action
  update(AppState value) => state = value;

  @action
  Future<void> addPlace(PlaceEntity place) async {
    update(AppState.loading());
    final result = await _addPlaceUseCase(place);
    result.fold(
      (l) => update(AppState.error(l)),
      (r) => update(AppState.success<PlaceEntity>(PlaceEntity(
        id: r,
        name: place.name,
        userId: place.userId,
      ))),
    );
  }

  @action
  Future<void> updatePlace(PlaceEntity place) async {
    update(AppState.loading());
    final result = await _updatePlaceUseCase(place);
    result.fold(
      (l) => update(AppState.error(l)),
      (r) => update(AppState.success<PlaceEntity>(PlaceEntity(
        id: place.id,
        name: place.name,
        userId: place.userId,
      ))),
    );
  }

  @action
  Future<bool> deletePlace(PlaceEntity place) async {
    final result = await _deletePlaceUseCase(place.id!);
    return result.isRight();
  }
}
