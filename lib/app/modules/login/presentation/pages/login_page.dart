import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/presentation/components/button/button.dart';
import '../components/users_list/user_list.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getUserList(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Flexible(
                    child: controller.store.state.when(
                      orElse: () => Container(),
                      success: (data) => data.isNotEmpty
                          ? UserList(
                              data: data,
                              onTap: (user) async {
                                await controller.selectUser(user);
                                Modular.to.pushReplacementNamed('/home/');
                              },
                            )
                          : const Center(
                              child: Text('Nenhum usuário cadastrado')),
                    ),
                  ),
                  Button(
                    label: 'Cadastrar',
                    onPressed: () => Modular.to.pushNamed('/login/add_user'),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Material(child: Container());
        }
      },
    );
  }
}
