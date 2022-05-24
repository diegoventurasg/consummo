import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../data/utils/color_list.dart';
import '../../controllers/consumption_controller.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...ColorList.list.map((e) => ColorItem(color: e)).toList(),
        ],
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  ColorItem({Key? key, required this.color}) : super(key: key);

  final int color;
  final consumptionController = Modular.get<ConsumptionController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => consumptionController.setColor(color),
      child: Container(
        height: 36,
        width: 36,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Color(color),
        ),
        child: Observer(builder: (context) {
          return Icon(consumptionController.color == color
              ? Icons.check_rounded
              : null);
        }),
      ),
    );
  }
}
