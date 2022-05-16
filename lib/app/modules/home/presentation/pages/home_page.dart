import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../components/consumption_selector/consumption_selector.dart';
import '../components/custom_app_bar/custom_app_bar.dart';
import '../components/selected_place/selected_place.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            SizedBox(height: 16),
            SelectedPlace(),
            SizedBox(height: 16),
            TextButton(
                onPressed: () {
                  Modular.to.pushNamed('/consumption/');
                },
                child: Text('click')),
            ConsumptionSelector(),
          ],
        ),
      ),
    );
  }
}
