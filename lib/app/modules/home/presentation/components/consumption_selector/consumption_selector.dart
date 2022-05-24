import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/data/dtos/selected_consumption_dto.dart';
import '../../../../../core/presentation/controllers/app_controller.dart';
import '../../../../consumption/data/dtos/consumption_dto.dart';
import '../../../../consumption/domain/entities/consumption_entity.dart';
import '../../../../consumption/presentation/pages/consumption_list_page.dart';
import 'consumption_selector_controller.dart';

class ConsumptionSelector extends StatefulWidget {
  const ConsumptionSelector({Key? key}) : super(key: key);

  @override
  State<ConsumptionSelector> createState() => _ConsumptionSelectorState();
}

class _ConsumptionSelectorState extends State<ConsumptionSelector> {
  final controller = Modular.get<ConsumptionSelectorController>();
  final appController = Modular.get<AppController>();

  @override
  void initState() {
    super.initState();
    controller.getConsumptionList();
  }

  void onPressConsumptionEdit() async {
    final result = await Modular.to
        .pushNamed<ConsumptionListNavigationResult>('/consumption/');
    if (result != null && result.hasConsumptionChanges) {
      controller.getConsumptionList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: Observer(builder: (_) {
            return controller.consumptionListStore.state.when(
                orElse: () => Container(),
                success: (data) {
                  final list = controller.consumptionList;
                  if (list.isEmpty) {
                    return const Text(
                        'Você ainda não tem um tipo de consumo cadastrado');
                  } else {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ConsumptionSelectorItem(
                          consumption: ConsumptionEntity(
                            name: 'Todos',
                            color: 0,
                            unit: '',
                            userId: 0,
                          ),
                        ),
                        ...controller.consumptionList
                            .map((e) => ConsumptionSelectorItem(consumption: e))
                            .toList(),
                        ConsumptionSelectorEditButton(
                            onTap: onPressConsumptionEdit),
                      ],
                    );
                  }
                });
          }),
        ),
      ],
    );
  }
}

class ConsumptionSelectorItem extends StatelessWidget {
  ConsumptionSelectorItem({
    Key? key,
    required this.consumption,
  }) : super(key: key);

  final ConsumptionEntity consumption;
  final appController = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => appController.setSelectedConsumption(
          SelectedConsumptionDto.fromMap(consumption.toMap())),
      child: Observer(builder: (_) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            //color: AppColors.background,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: appController.selectedConsumption?.id == consumption.id
                    ? Colors.red
                    : Colors.green),
          ),
          child: Center(
            child: Text(consumption.name
                //style: AppTextStyles.titleHeading,
                ),
          ),
        );
      }),
    );
  }
}

class ConsumptionSelectorEditButton extends StatelessWidget {
  const ConsumptionSelectorEditButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green),
        ),
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
    );
  }
}
