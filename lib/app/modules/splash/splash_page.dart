import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/presentation/controllers/app_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final appController = Modular.get<AppController>();

  @override
  void initState() {
    super.initState();
    appController.initApp().then((value) {
      Future.delayed(const Duration(seconds: 1)).then((value) {
        Modular.to.pushReplacementNamed('/home/');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
