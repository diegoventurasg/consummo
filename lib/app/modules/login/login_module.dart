import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/sqflite/sqflite_add_user_datasource.dart';
import 'data/datasources/sqflite/sqflite_get_users_list_datasource.dart';
import 'data/repositories/add_user_repository.dart';
import 'data/repositories/get_users_list_repository.dart';
import 'domain/usecases/add_user_usecase.dart';
import 'domain/usecases/get_user_list_usecase.dart';
import 'presentation/controllers/add_user_controller.dart';
import 'presentation/controllers/login_controller.dart';
import 'presentation/pages/add_user_page.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/stores/add_user_store.dart';
import 'presentation/stores/user_list_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    //Bind((i) => UserRepositoryDao(database: i.get())),
    //stores
    Bind.factory((i) => UserListStore(i.get())),
    Bind.factory((i) => AddUserStore(i.get())),
    //controllers
    Bind.factory((i) => LoginController(i.get())),
    Bind.factory((i) => AddUserController(i.get())),
    //datasources
    Bind.factory((i) => SqfliteAddUserDatasource(i.get())),
    Bind.factory((i) => SqfliteGetUserListDatasource(i.get())),
    //repositories
    Bind.factory((i) => AddUserRepositoryImpl(i.get())),
    Bind.factory((i) => GetUserListRepositoryImpl(i.get())),
    //usecases
    Bind.factory((i) => AddUserUseCaseImpl(i.get())),
    Bind.factory((i) => GetUserListUseCaseImpl(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => const LoginPage()),
    ChildRoute("/add_user", child: (_, args) => const AddUserPage()),
  ];
}
