import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/data/dtos/selected_place_dto.dart';
import '../../../../../core/presentation/controllers/app_controller.dart';
import '../../../../place/data/dtos/place_dto.dart';
import '../../../../place/domain/entities/place_entity.dart';

class PlaceSelectorItem extends StatefulWidget {
  const PlaceSelectorItem({
    Key? key,
    required this.place,
  }) : super(key: key);

  final PlaceEntity place;

  @override
  State<PlaceSelectorItem> createState() => _PlaceSelectorItemState();
}

class _PlaceSelectorItemState extends State<PlaceSelectorItem> {
  final appController = Modular.get<AppController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => appController
          .setSelectedPlace(SelectedPlaceDto.fromMap(widget.place.toMap())),
      child: Observer(builder: (_) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            //color: AppColors.background,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: appController.selectedPlace?.id == widget.place.id
                    ? Colors.red
                    : Colors.green),
          ),
          child: Text(
            widget.place.name,
            //style: AppTextStyles.titleHeading,
          ),
        );
      }),
    );
  }
}
