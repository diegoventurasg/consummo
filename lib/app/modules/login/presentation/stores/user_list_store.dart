import 'package:mobx/mobx.dart';

import '../../../../core/presentation/states/app_state.dart';
import '../../domain/usecases/get_user_list_usecase.dart';
part 'user_list_store.g.dart';

class UserListStore = _UserListStoreBase with _$UserListStore;

abstract class _UserListStoreBase with Store {
  final IGetUserListUseCase _getUserListUseCase;

  @observable
  AppState state = AppState.empty();

  _UserListStoreBase(this._getUserListUseCase);

  @action
  update(AppState value) => state = value;

  @action
  Future<void> fetch() async {
    update(AppState.loading());
    final result = await _getUserListUseCase();
    result.fold(
      (l) => update(AppState.error(l)),
      (r) => update(AppState.success(r)),
    );
  }
}
