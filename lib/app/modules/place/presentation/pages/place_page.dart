import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx/mobx.dart';

import '../../../../core/data/dtos/selected_place_dto.dart';
import '../../../../core/presentation/components/custom_text_field/custom_text_field.dart';
import '../../../../core/presentation/controllers/app_controller.dart';
import '../../../../core/presentation/states/app_state.dart';
import '../../../../core/presentation/components/button/button.dart';
import '../../data/dtos/place_dto.dart';
import '../../domain/entities/place_entity.dart';
import '../controllers/place_controller.dart';
import '../components/delete_dialog/delete_dialog.dart';

class PlaceNavigationResult {
  final bool deleted;
  final PlaceEntity place;

  PlaceNavigationResult({required this.deleted, required this.place});
}

class PlacePage extends StatefulWidget {
  const PlacePage({Key? key, this.place}) : super(key: key);

  final PlaceEntity? place;

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  final controller = Modular.get<PlaceController>();
  final appController = Modular.get<AppController>();
  late final ReactionDisposer disposer;
  late final bool isSelected;

  @override
  void initState() {
    super.initState();
    controller.setPlaceName(widget.place?.name);
    isSelected = widget.place != null &&
        appController.selectedPlace?.id == widget.place!.id;
    disposer = reaction(
      (_) => controller.store.state,
      (AppState state) => state.when(
        orElse: () {},
        success: (data) {
          final place = data as PlaceEntity;
          if (widget.place == null) {
            //if new place
            //change selected place and go to home page
            appController.setSelectedPlace(
              SelectedPlaceDto.fromMap(place.toMap()),
            );
            Modular.to.navigate('/home/');
          } else {
            //if edit just pop
            Modular.to.pop<PlaceNavigationResult>(
              PlaceNavigationResult(deleted: false, place: place),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Observer(
                builder: (context) => controller.store.state.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  orElse: () => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.place == null
                            ? 'Adicionar local'
                            : 'Editar local',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      if (widget.place != null && !isSelected)
                        TextButton(
                          onPressed: () async {
                            final deleted = await showDialog<bool>(
                              context: context,
                              builder: (BuildContext context) =>
                                  const DeleteDialog(),
                            );

                            if (deleted ?? false) {
                              final place = widget.place!;
                              final result = await controller.delete(place);
                              if (result) {
                                Modular.to.pop<PlaceNavigationResult>(
                                  PlaceNavigationResult(
                                    deleted: true,
                                    place: place,
                                  ),
                                );
                              }
                            }
                          },
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(
                                    Icons.delete_rounded,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                  Text(
                                    "Deletar local",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      CustomTextField(
                        label: 'Local',
                        autofocus: true,
                        initialValue: controller.placeName,
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: controller.setPlaceName,
                        validator: (value) =>
                            value == null || value.trim().isEmpty
                                ? "Informe o nome"
                                : null,
                      ),
                      const SizedBox(height: 15),
                      Observer(builder: (_) {
                        return Row(
                          children: [
                            Expanded(
                              child: Button(
                                onPressed: controller.isFormValid &&
                                        !controller.store.isLoading
                                    ? () => controller.save(widget.place?.id)
                                    : null,
                                label:
                                    widget.place == null ? "SALVAR" : "EDITAR",
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
