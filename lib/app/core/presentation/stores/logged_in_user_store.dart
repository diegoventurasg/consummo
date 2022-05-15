import 'package:mobx/mobx.dart';

import '../../domain/entities/logged_in_user_entity.dart';
import '../../domain/usecases/get_logged_in_user_usecase.dart';
import '../../domain/usecases/set_logged_in_user_usecase.dart';
import '../states/app_state.dart';

part 'logged_in_user_store.g.dart';

class LoggedInUserStore = _LoggedInUserStoreBase with _$LoggedInUserStore;

abstract class _LoggedInUserStoreBase with Store {
  final IGetLoggedInUserUseCase _getLoggedInUserUseCase;
  final ISetLoggedInUserUseCase _setLoggedInUserUseCase;

  @observable
  AppState state = AppState.empty();

  _LoggedInUserStoreBase(
    this._getLoggedInUserUseCase,
    this._setLoggedInUserUseCase,
  );

  @action
  update(AppState value) => state = value;

  @action
  Future<void> get() async {
    update(AppState.loading());
    final result = await _getLoggedInUserUseCase();
    result.fold(
      (l) => update(AppState.error(l)),
      (r) => update(AppState.success<LoggedInUserEntity>(r)),
    );
  }

  @action
  Future<void> set(LoggedInUserEntity user) async {
    update(AppState.loading());
    final result = await _setLoggedInUserUseCase(user);
    result.fold(
      (l) => update(AppState.error(l)),
      (r) => update(AppState.success<LoggedInUserEntity>(user)),
    );
  }
}
