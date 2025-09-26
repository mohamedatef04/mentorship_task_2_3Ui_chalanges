import 'package:flutter/material.dart';
import 'package:ui_chalenges/widgets/first_ui_listview.dart';

class FirstUiView extends StatelessWidget {
  const FirstUiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Task Manager',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const FirstUiListview(),
    );
  }
}
