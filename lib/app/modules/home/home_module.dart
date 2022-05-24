import 'package:flutter_modular/flutter_modular.dart';

import '../consumption/consumption_module.dart';
import 'presentation/components/consumption_selector/consumption_selector_controller.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Module> imports = [
    ConsumptionModule(),
  ];

  @override
  final List<Bind> binds = [
    //stores
    //controllers
    Bind.factory((i) => ConsumptionSelectorController(i.get())),
    //datasources
    //repositories
    //usecases
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => const HomePage()),
  ];
}
