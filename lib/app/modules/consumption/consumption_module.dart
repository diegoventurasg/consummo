import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/consumption_list_page.dart';

class ConsumptionModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ConsumptionListPage()),
      ];
}
