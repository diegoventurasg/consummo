import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/data/dtos/selected_place_dto.dart';
import '../../data/dtos/place_dto.dart';
import '../../../../core/presentation/controllers/app_controller.dart';
import '../../../../core/presentation/components/button/button.dart';
import '../../domain/entities/place_entity.dart';
import '../controllers/place_list_controller.dart';
import 'place_page.dart';

class PlaceListPage extends StatefulWidget {
  const PlaceListPage({Key? key}) : super(key: key);

  @override
  State<PlaceListPage> createState() => _PlaceListPageState();
}

class _PlaceListPageState extends State<PlaceListPage> {
  final controller = Modular.get<PlaceListController>();
  final appController = Modular.get<AppController>();

  @override
  void initState() {
    super.initState();
    final userId = appController.loggedInUser!.id;
    controller.get(userId: userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.green),
        actions: [
          TextButton(
            child: Observer(
              builder: (_) => Icon(
                controller.isEditing ? Icons.check_rounded : Icons.edit_rounded,
              ),
            ),
            onPressed: controller.toggleEditing,
          ),
        ],
      ),
      body: Column(
        children: [
          Observer(builder: (_) {
            return controller.store.state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => Container(),
              success: (data) {
                //final list = data as List<PlaceEntity>;
                final list = controller.placeList;
                return list.isNotEmpty
                    ? Flexible(
                        child: AnimatedList(
                          key: controller.listKey,
                          initialItemCount: list.length,
                          itemBuilder: _buildPlaceItem,
                        ),
                      )
                    : const Text('Você ainda não tem um local cadastrado');
              },
            );
          }),
          Observer(
              builder: (_) => controller.isEditing
                  ? Container()
                  : Container(
                      padding: const EdgeInsets.all(10),
                      width: double.maxFinite,
                      child: Button(
                        label: "Novo",
                        onPressed: () =>
                            Modular.to.pushNamed<PlaceEntity>('/place/place'),
                      ),
                    )),
        ],
      ),
    );
  }

  Widget _buildPlaceItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    final place = controller.placeList[index];
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: () async {
            if (controller.isEditing) {
              final result = await Modular.to.pushNamed<PlaceNavigationResult>(
                  '/place/place',
                  arguments: place);
              if (result != null) {
                //update or delete
                if (result.deleted) {
                  controller.deleteItem(index, place);
                } else {
                  controller.updateItem(index, result.place);
                  if (place.id == appController.selectedPlace?.id) {
                    appController.setSelectedPlace(
                      SelectedPlaceDto.fromMap(result.place.toMap()),
                    );
                  }
                }
              }
            } else {
              //select
              appController.setSelectedPlace(
                SelectedPlaceDto.fromMap(place.toMap()),
              );
              Modular.to.pop();
            }
          },
          child: ListTile(
            title: Text(place.name),
            //style: AppTextStyles.titleHeading,
          ),
        ),
      ),
    );
  }
}
