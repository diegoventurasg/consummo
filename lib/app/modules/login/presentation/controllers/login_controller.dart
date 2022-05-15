import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/data/dtos/logged_in_user_dto.dart';
import '../../../../core/presentation/controllers/app_controller.dart';
import '../../data/dtos/user_dto.dart';
import '../../domain/entities/user_entity.dart';
import '../stores/user_list_store.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final UserListStore store;
  final appController = Modular.get<AppController>();

  _LoginControllerBase(this.store);

  Future<void> getUserList() async {
    await store.fetch();
  }

  Future<void> selectUser(UserEntity user) async {
    await appController.setLoggedInUser(LoggedInUserDto.fromMap(user.toMap()));
  }
}
