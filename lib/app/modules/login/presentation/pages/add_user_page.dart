import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/domain/entities/logged_in_user_entity.dart';
import '../../../../core/presentation/controllers/app_controller.dart';
import '../../../../core/presentation/states/app_state.dart';
import '../../../../core/presentation/components/button/button.dart';
import '../../../../core/presentation/components/custom_text_field/custom_text_field.dart';
import '../controllers/add_user_controller.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final controller = Modular.get<AddUserController>();
  final appController = Modular.get<AppController>();
  late final ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = reaction(
        (_) => controller.store.state,
        (AppState state) => state.when(
              orElse: () {},
              success: (data) async {
                //cadastrado
                LoggedInUserEntity newUser =
                    LoggedInUserEntity(id: data, name: controller.userName!);
                await appController.setLoggedInUser(newUser);
                Modular.to.pushReplacementNamed('/home/');
              },
            ));
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text('Olá! Informe seu nome.'),
            CustomTextField(
              label: 'Nome',
              onChanged: controller.setUserName,
              validator: (value) => value == null || value.trim().isEmpty
                  ? "Informe o nome"
                  : null,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Observer(builder: (_) {
                  return Button(
                    label: 'Continuar',
                    onPressed:
                        controller.isFormValid ? controller.addUser : null,
                  );
                }),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
