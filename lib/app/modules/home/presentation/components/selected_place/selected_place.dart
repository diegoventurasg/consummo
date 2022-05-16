import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/presentation/controllers/app_controller.dart';

class SelectedPlace extends StatefulWidget {
  const SelectedPlace({Key? key}) : super(key: key);

  @override
  State<SelectedPlace> createState() => _SelectedPlaceState();
}

class _SelectedPlaceState extends State<SelectedPlace> {
  final appController = Modular.get<AppController>();

  @override
  void initState() {
    super.initState();
    appController.getSelectedPlace();
  }

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
