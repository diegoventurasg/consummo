import 'package:mobx/mobx.dart';

import '../../../../core/presentation/states/app_state.dart';
import '../../domain/usecases/get_place_list_usecase.dart';

part 'place_list_store.g.dart';

class PlaceListStore = _PlaceListStoreBase with _$PlaceListStore;

abstract class _PlaceListStoreBase with Store {
  _PlaceListStoreBase(
    this._getPlaceListUseCase,
  );

  final IGetPlaceListUseCase _getPlaceListUseCase;

  @observable
  AppState state = AppState.empty();

  @action
  void update(AppState value) => state = value;

  @action
  Future<void> get(int userId) async {
    update(AppState.loading());
    final result = await _getPlaceListUseCase(userId);
    result.fold(
      (l) => update(AppState.error(l)),
      (r) => update(AppState.success(r)),
    );
  }
}
