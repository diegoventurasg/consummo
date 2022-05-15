import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/presentation/controllers/app_controller.dart';

class SelectedPlace extends StatelessWidget {
  const SelectedPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = Modular.get<AppController>();

    return InkWell(
      onTap: () => Modular.to.pushNamed('/place/'),
      child: Observer(builder: (_) {
        final place = appController.selectedPlace;
        return Text(
          place != null ? place.name : 'Você ainda não tem um local cadastrado',
        );
      }),
    );
  }
}
