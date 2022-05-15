import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/sqflite/sqflite_add_place_datasource.dart';
import 'data/datasources/sqflite/sqflite_delete_place_datasource.dart';
import 'data/datasources/sqflite/sqflite_get_place_list_datasource.dart';
import 'data/datasources/sqflite/sqflite_update_place_datasource.dart';
import 'data/repositories/add_place_repository_impl.dart';
import 'data/repositories/delete_place_repository_impl.dart';
import 'data/repositories/get_place_list_repository_impl.dart';
import 'data/repositories/update_place_repository_impl.dart';
import 'domain/usecases/add_place_usecase.dart';
import 'domain/usecases/delete_place_usecase.dart';
import 'domain/usecases/get_place_list_usecase.dart';
import 'domain/usecases/update_place_usecase.dart';
import 'presentation/controllers/place_controller.dart';
import 'presentation/controllers/place_list_controller.dart';
import 'presentation/pages/place_list_page.dart';
import 'presentation/pages/place_page.dart';
import 'presentation/stores/place_list_store.dart';
import 'presentation/stores/place_store.dart';

class PlaceModule extends Module {
  @override
  List<Bind> get binds => [
        //Bind((i) => PlaceRepositoryDao(database: i.get())),
        //stores
        Bind.lazySingleton((i) => PlaceListStore(i.get()), export: true),
        Bind.factory((i) => PlaceStore(i.get(), i.get(), i.get())),
        //controllers
        Bind.factory((i) => PlaceListController(i.get())),
        Bind.factory((i) => PlaceController(i.get())),
        //datasources
        Bind.factory((i) => SqfliteGetPlaceListDatasource(i.get()),
            export: true),
        Bind.factory((i) => SqfliteAddPlaceDatasource(i.get())),
        Bind.factory((i) => SqfliteUpdatePlaceDatasource(i.get())),
        Bind.factory((i) => SqfliteDeletePlaceDatasource(i.get())),
        //repositories
        Bind.factory((i) => GetPlaceListRepositoryImpl(i.get()), export: true),
        Bind.factory((i) => AddPlaceRepositoryImpl(i.get())),
        Bind.factory((i) => UpdatePlaceRepositoryImpl(i.get())),
        Bind.factory((i) => DeletePlaceRepositoryImpl(i.get())),
        //usecases
        Bind.factory((i) => GetPlaceListUseCaseImpl(i.get()), export: true),
        Bind.factory((i) => AddPlaceUseCaseImpl(i.get())),
        Bind.factory((i) => UpdatePlaceUseCaseImpl(i.get())),
        Bind.factory((i) => DeletePlaceUseCaseImpl(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const PlaceListPage()),
        ChildRoute('/place',
            child: (context, args) => PlacePage(place: args.data)),
      ];
}
