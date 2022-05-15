import 'package:flutter_modular/flutter_modular.dart';

import '../place/place_module.dart';
import 'presentation/components/place_selector/place_selector_controller.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Module> imports = [PlaceModule()];

  @override
  final List<Bind> binds = [
    //stores
    //controllers
    Bind.factory((i) => PlaceSelectorController(i.get())),
    //datasources
    //repositories
    //usecases
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => const HomePage()),
  ];
}
