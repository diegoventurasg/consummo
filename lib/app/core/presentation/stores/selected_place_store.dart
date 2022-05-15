import 'package:mobx/mobx.dart';

import '../../domain/entities/selected_place_entity.dart';
import '../../domain/usecases/get_selected_place_usecase.dart';
import '../../domain/usecases/set_selected_place_usecase.dart';
import '../states/app_state.dart';

part 'selected_place_store.g.dart';

class SelectedPlaceStore = _SelectedPlaceStoreBase with _$SelectedPlaceStore;

abstract class _SelectedPlaceStoreBase with Store {
  final IGetSelectedPlaceUseCase _getSelectedPlaceUseCase;
  final ISetSelectedPlaceUseCase _setSelectedPlaceUseCase;

  @observable
  AppState state = AppState.empty();

  _SelectedPlaceStoreBase(
    this._getSelectedPlaceUseCase,
    this._setSelectedPlaceUseCase,
  );

  @action
  update(AppState value) => state = value;

  @action
  Future<void> get(int userId) async {
    update(AppState.loading());
    final result = await _getSelectedPlaceUseCase(userId);
    result.fold(
      (l) => update(AppState.error(l)),
      (r) => update(AppState.success(r)),
    );
  }

  @action
  Future<void> set(SelectedPlaceEntity place) async {
    update(AppState.loading());
    final result = await _setSelectedPlaceUseCase(place);
    result.fold(
      (l) => update(AppState.error(l)),
      (r) => update(AppState.success(place)),
    );
  }
}
