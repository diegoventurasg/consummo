import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/presentation/controllers/app_controller.dart';
import '../../../../home/presentation/components/place_selector/place_selector_controller.dart';
import 'place_selector_item.dart';

class PlaceSelector extends StatefulWidget {
  const PlaceSelector({Key? key}) : super(key: key);

  @override
  State<PlaceSelector> createState() => _PlaceSelectorState();
}

class _PlaceSelectorState extends State<PlaceSelector> {
  final controller = Modular.get<PlaceSelectorController>();
  final appController = Modular.get<AppController>();

  @override
  void initState() {
    super.initState();
    final userId = appController.loggedInUser!.id;
    controller.getPlaceList(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Meus locais'),
              const SizedBox(width: 5),
              InkWell(
                onTap: () => Modular.to.pushNamed('/place/'),
                borderRadius: BorderRadius.circular(10),
                child: const Icon(
                  Icons.edit,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Observer(builder: (_) {
            return controller.placeListStore.state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => Container(),
              success: (data) {
                // final placeList = controller.placeListStore.placeList;
                final placeList = List.empty();

                if (placeList.isNotEmpty) {
                  return SizedBox(
                    height: 40,
                    child: ListView.builder(
                        itemCount: placeList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            PlaceSelectorItem(place: placeList[index])),
                  );
                } else {
                  return const Text('Você ainda não tem um local cadastrado');
                }
              },
            );
          }),
        ],
      ),
    );
  }
}
