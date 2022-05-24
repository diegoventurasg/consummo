import 'package:flutter_modular/flutter_modular.dart';

import '../../core/data/storages/sqflite/repositories/consumption_repository.dart';
import 'data/datasources/sqflite/sqflite_add_consumption_datasource.dart';
import 'data/datasources/sqflite/sqflite_delete_consumption_datasource.dart';
import 'data/datasources/sqflite/sqflite_get_consumption_list_datasource.dart';
import 'data/datasources/sqflite/sqflite_update_consumption_datasource.dart';
import 'data/repositories/add_consumption_repository_impl.dart';
import 'data/repositories/delete_consumption_repository_impl.dart';
import 'data/repositories/get_consumption_list_repository_impl.dart';
import 'data/repositories/update_consumption_repository_impl.dart';
import 'domain/usecases/add_consumption_usecase.dart';
import 'domain/usecases/delete_consumption_usecase.dart';
import 'domain/usecases/get_consumption_list_usecase.dart';
import 'domain/usecases/update_consumption_usecase.dart';
import 'presentation/controllers/consumption_controller.dart';
import 'presentation/controllers/consumption_list_controller.dart';
import 'presentation/pages/consumption_list_page.dart';
import 'presentation/pages/consumption_page.dart';
import 'presentation/stores/consumption_list_store.dart';
import 'presentation/stores/consumption_store.dart';

class ConsumptionModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ConsumptionRepositoryDao(database: i.get()), export: true),
    //stores
    Bind.factory((i) => ConsumptionListStore(i.get()), export: true),
    Bind.factory((i) => ConsumptionStore(i.get(), i.get(), i.get())),
    //controllers
    Bind.factory((i) => ConsumptionListController(i.get())),
    Bind.lazySingleton((i) => ConsumptionController(i.get())),
    //datasources
    Bind.factory((i) => SqfliteGetConsumptionListDatasource(i.get()),
        export: true),
    Bind.factory((i) => SqfliteGetConsumptionListDatasource(i.get())),
    Bind.factory((i) => SqfliteAddConsumptionDatasource(i.get())),
    Bind.factory((i) => SqfliteDeleteConsumptionDatasource(i.get())),
    Bind.factory((i) => SqfliteUpdateConsumptionDatasource(i.get())),
    //respositories
    Bind.factory((i) => GetConsumptionListRepositoryImpl(i.get()),
        export: true),
    Bind.factory((i) => AddConsumptionRepositoryImpl(i.get())),
    Bind.factory((i) => DeleteConsumptionRepositoryImpl(i.get())),
    Bind.factory((i) => UpdateConsumptionRepositoryImpl(i.get())),
    //usecases
    Bind.factory((i) => GetConsumptionListUseCaseImpl(i.get()), export: true),
    Bind.factory((i) => AddConsumptionUseCaseImpl(i.get())),
    Bind.factory((i) => DeleteConsumptionUseCaseImpl(i.get())),
    Bind.factory((i) => UpdateConsumptionUseCaseImpl(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const ConsumptionListPage()),
    ChildRoute('/consumption',
        child: (_, args) => ConsumptionPage(consumption: args.data)),
  ];
}
