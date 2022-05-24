import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/domain/entities/selected_consumption_entity.dart';
import '../../../../core/presentation/components/button/button.dart';
import '../../../../core/presentation/controllers/app_controller.dart';
import '../controllers/consumption_list_controller.dart';
import 'consumption_page.dart';

class ConsumptionListNavigationResult {
  final bool hasConsumptionChanges;

  ConsumptionListNavigationResult({required this.hasConsumptionChanges});
}

class ConsumptionListPage extends StatefulWidget {
  const ConsumptionListPage({Key? key}) : super(key: key);

  @override
  State<ConsumptionListPage> createState() => _ConsumptionListPageState();
}

class _ConsumptionListPageState extends State<ConsumptionListPage> {
  final controller = Modular.get<ConsumptionListController>();
  final appController = Modular.get<AppController>();

  @override
  void initState() {
    super.initState();
    final userId = appController.loggedInUser!.id;
    controller.get(userId: userId);
  }

  void handleWillPop() {
    Modular.to.pop<ConsumptionListNavigationResult>(
        ConsumptionListNavigationResult(
            hasConsumptionChanges: controller.hasChanges));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        handleWillPop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Observer(builder: (_) {
              return controller.store.state.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                orElse: () => Container(),
                success: (data) {
                  final list = controller.consumptionList;
                  return list.isNotEmpty
                      ? Flexible(
                          child: AnimatedList(
                            key: controller.listKey,
                            initialItemCount: list.length,
                            itemBuilder: _buildConsumptionItem,
                          ),
                        )
                      : const Text(
                          'Você ainda não tem um tipo de consumo cadastrado');
                },
              );
            }),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.maxFinite,
              child: Button(
                label: "Novo",
                onPressed: () async {
                  final result = await Modular.to
                      .pushNamed<ConsumptionNavigationResult>(
                          '/consumption/consumption');
                  if (result != null) {
                    controller.addItem(result.consumption);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildConsumptionItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    final consumption = controller.consumptionList[index];
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: () async {
            final result = await Modular.to
                .pushNamed<ConsumptionNavigationResult>(
                    '/consumption/consumption',
                    arguments: consumption);
            if (result != null) {
              //update or delete
              if (result.deleted) {
                controller.deleteItem(index, consumption);
                appController.setSelectedConsumption(
                    const SelectedConsumptionEntity(name: 'Todos'));
              } else {
                controller.updateItem(index, result.consumption);
              }
            }
          },
          child: ListTile(
            title: Text(consumption.name),
            //style: AppTextStyles.titleHeading,
          ),
        ),
      ),
    );
  }
}
