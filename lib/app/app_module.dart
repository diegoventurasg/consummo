import 'package:flutter_modular/flutter_modular.dart';

import 'core/data/storages/sqflite/database.dart';
import 'core/data/storages/sqflite/repositories/place_repository.dart';
import 'core/data/storages/sqflite/repositories/user_repository.dart' as db;
import 'core/data/storages/shared_preferences/repositories/user_repository.dart'
    as prefs;
import 'modules/consumption/consumption_module.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/place/place_module.dart';
import 'modules/splash/splash_module.dart';
import 'auth_guard.dart';
import 'core/data/datasources/sqflite/sqflite_get_selected_place_datasource.dart';
import 'core/data/datasources/sqflite/sqflite_set_selected_place_datasource.dart';
import 'core/data/repositories/get_selected_place_repository_impl.dart';
import 'core/data/repositories/set_selected_place_repository_impl.dart';
import 'core/domain/usecases/get_logged_in_user_usecase.dart';
import 'core/domain/usecases/get_selected_place_usecase.dart';
import 'core/domain/usecases/set_logged_in_user_usecase.dart';
import 'core/data/datasources/shared_preferences/shared_preferences_get_logged_in_user_datasource.dart';
import 'core/data/datasources/shared_preferences/shared_preferences_set_logged_in_user_datasource.dart';
import 'core/data/repositories/get_logged_in_user_repository_impl.dart';
import 'core/data/repositories/set_logged_in_user_repository_impl.dart';
import 'core/domain/usecases/set_selected_place_usecase.dart';
import 'core/presentation/controllers/app_controller.dart';
import 'core/presentation/stores/logged_in_user_store.dart';
import 'core/presentation/stores/selected_place_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => DatabaseHelper.instance.database),
    Bind((i) => prefs.UserRepositoryDao()),
    Bind((i) => db.UserRepositoryDao(database: i.get())),
    Bind((i) => PlaceRepositoryDao(database: i.get())),
    //stores
    Bind.lazySingleton((i) => LoggedInUserStore(i.get(), i.get())),
    Bind.lazySingleton((i) => SelectedPlaceStore(i.get(), i.get())),
    //controllers
    Bind.lazySingleton((i) => AppController(i.get(), i.get())),
    //datasources
    Bind.factory((i) => SharedPreferencesGetLoggedInUserDatasource(i.get())),
    Bind.factory((i) => SharedPreferencesSetLoggedInUserDatasource(i.get())),
    Bind.factory((i) => SqfliteGetSelectedPlaceDatasource(i.get())),
    Bind.factory((i) => SqfliteSetSelectedPlaceDatasource(i.get())),
    //repositories
    Bind.factory((i) => GetLoggedInUserRepositoryImpl(i.get())),
    Bind.factory((i) => SetLoggedInUserRepositoryImpl(i.get())),
    Bind.factory((i) => GetSelectedPlaceRepositoryImpl(i.get())),
    Bind.factory((i) => SetSelectedPlaceRepositoryImpl(i.get())),
    //usecases
    Bind.factory((i) => GetLoggedInUserUseCaseImpl(i.get())),
    Bind.factory((i) => SetLoggedInUserUseCaseImpl(i.get())),
    Bind.factory((i) => GetSelectedPlaceUseCaseImpl(i.get())),
    Bind.factory((i) => SetSelectedPlaceUseCaseImpl(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule(), guards: [AuthGuard()]),
    ModuleRoute('/place', module: PlaceModule(), guards: [AuthGuard()]),
    ModuleRoute('/consumption',
        module: ConsumptionModule(), guards: [AuthGuard()]),
  ];
}
