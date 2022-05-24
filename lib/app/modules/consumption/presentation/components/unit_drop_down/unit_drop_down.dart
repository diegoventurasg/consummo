import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../data/utils/unit_list.dart';
import '../../controllers/consumption_controller.dart';

class UnitDropDown extends StatelessWidget {
  UnitDropDown({Key? key}) : super(key: key);

  final ConsumptionController consumptionController =
      Modular.get<ConsumptionController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton<String>(
          value: consumptionController.unit,
          onChanged: consumptionController.setUnit,
          underline: const SizedBox(),
          isExpanded: true,
          items: UnitList.list
              .map<DropdownMenuItem<String>>(
                (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
              )
              .toList(),
        ),
      );
    });
  }
}
