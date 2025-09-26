import 'package:flutter/material.dart';
import 'package:ui_chalenges/views/main_home_view.dart';

void main() {
  runApp(const UiChalanges());
}

class UiChalanges extends StatelessWidget {
  const UiChalanges({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainHomeView(),
    );
  }
}
