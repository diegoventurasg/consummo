import 'package:consummo/app/modules/consumption/presentation/components/unit_drop_down/unit_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/presentation/components/button/button.dart';
import '../../../../core/presentation/components/confirmation_dialog/confirmation_dialog.dart';
import '../../../../core/presentation/components/custom_text_field/custom_text_field.dart';
import '../../../../core/presentation/controllers/app_controller.dart';
import '../../../../core/presentation/states/app_state.dart';
import '../../domain/entities/consumption_entity.dart';
import '../components/color_picker/color_picker.dart';
import '../controllers/consumption_controller.dart';

class ConsumptionNavigationResult {
  final bool deleted;
  final ConsumptionEntity consumption;

  ConsumptionNavigationResult(
      {required this.deleted, required this.consumption});
}

class ConsumptionPage extends StatefulWidget {
  const ConsumptionPage({
    Key? key,
    this.consumption,
  }) : super(key: key);

  final ConsumptionEntity? consumption;

  @override
  State<ConsumptionPage> createState() => _ConsumptionPageState();
}

class _ConsumptionPageState extends State<ConsumptionPage> {
  final controller = Modular.get<ConsumptionController>();
  final appController = Modular.get<AppController>();
  late final ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    controller.setInitialValues(widget.consumption);
    disposer = reaction(
      (_) => controller.store.state,
      (AppState state) => state.when(
          orElse: () {},
          success: (data) {
            final consumption = data as ConsumptionEntity;
            Modular.to.pop<ConsumptionNavigationResult>(
              ConsumptionNavigationResult(
                deleted: false,
                consumption: consumption,
              ),
            );
          }),
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(
                  builder: (context) => controller.store.state.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    orElse: () => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text(
                            widget.consumption == null
                                ? 'Adicionar consumo'
                                : 'Editar consumo',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        if (widget.consumption != null)
                          TextButton(
                            onPressed: () async {
                              final deleted = await showDialog<bool>(
                                context: context,
                                builder: (BuildContext context) {
                                  return const ConfirmationDialog(
                                    title: 'Excluir',
                                    message:
                                        'Deseja excluir este consumo e seus respectivos dados definitivamente?',
                                    yesButton: 'Confirmar',
                                    noButton: 'Cancelar',
                                  );
                                },
                              );

                              if (deleted ?? false) {
                                final consumption = widget.consumption!;
                                final result =
                                    await controller.delete(consumption);
                                if (result) {
                                  Modular.to.pop<ConsumptionNavigationResult>(
                                    ConsumptionNavigationResult(
                                      deleted: true,
                                      consumption: consumption,
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
                                      "Deletar consumo",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        CustomTextField(
                          label: 'Consumo',
                          autofocus: true,
                          initialValue: controller.name,
                          textCapitalization: TextCapitalization.sentences,
                          onChanged: controller.setName,
                          validator: (value) =>
                              !controller.isNameValid ? "Informe o nome" : null,
                        ),
                        const SizedBox(height: 8),
                        UnitDropDown(),
                        const SizedBox(height: 8),
                        const ColorPicker(),
                        const SizedBox(height: 15),
                        Observer(builder: (_) {
                          return Row(
                            children: [
                              Expanded(
                                child: Button(
                                  onPressed: controller.isFormValid &&
                                          !controller.store.isLoading
                                      ? () => controller
                                          .save(widget.consumption?.id)
                                      : null,
                                  label: widget.consumption == null
                                      ? "SALVAR"
                                      : "EDITAR",
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
      ),
    );
  }
}
