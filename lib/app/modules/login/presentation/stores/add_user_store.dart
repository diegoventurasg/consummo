import 'package:mobx/mobx.dart';

import '../../../../core/presentation/states/app_state.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/add_user_usecase.dart';

part 'add_user_store.g.dart';

class AddUserStore = _AddUserStoreBase with _$AddUserStore;

abstract class _AddUserStoreBase with Store {
  final IAddUserUseCase _addUserUseCase;

  @observable
  AppState state = AppState.empty();

  _AddUserStoreBase(this._addUserUseCase);

  @action
  update(AppState value) => state = value;

  @action
  Future<void> save(UserEntity newUser) async {
    update(AppState.loading());
    final result = await _addUserUseCase(user: newUser);
    result.fold(
      (l) => update(AppState.error(l)),
      (r) => update(AppState.success<int>(r)),
    );
  }
}
