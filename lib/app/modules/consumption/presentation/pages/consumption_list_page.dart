import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/presentation/components/button/button.dart';
import '../../domain/entities/consumption_entity.dart';

class ConsumptionListPage extends StatelessWidget {
  const ConsumptionListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.maxFinite,
            child: Button(
              label: "Novo",
              onPressed: () => Modular.to
                  .pushNamed<ConsumptionEntity>('/consumption/consumption'),
            ),
          )
        ],
      ),
    );
  }
}
