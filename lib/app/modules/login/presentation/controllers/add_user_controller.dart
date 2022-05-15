import 'package:mobx/mobx.dart';

import '../../domain/entities/user_entity.dart';
import '../stores/add_user_store.dart';

part 'add_user_controller.g.dart';

class AddUserController = _AddUserControllerBase with _$AddUserController;

abstract class _AddUserControllerBase with Store {
  final AddUserStore store;

  _AddUserControllerBase(this.store);

  @observable
  String? userName;

  @action
  setUserName(String? value) => userName = value?.trim();

  @computed
  bool get isUserNameValid => userName != null && userName!.trim().isNotEmpty;

  @computed
  bool get isFormValid => isUserNameValid;

  Future<void> addUser() async {
    if (isFormValid) {
      UserEntity user = UserEntity(name: userName!);
      await store.save(user);
    }
  }
}
