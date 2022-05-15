import 'package:flutter_modular/flutter_modular.dart';

import 'core/presentation/controllers/app_controller.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/login/');

  @override
  Future<bool> canActivate(String path, ModularRoute route) {
    return Future.value(Modular.get<AppController>().isUserLogged);
  }
}
