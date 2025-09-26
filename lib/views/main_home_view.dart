import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_chalenges/cubit/nav_bar_cubit.dart';
import 'package:ui_chalenges/views/first_ui_view.dart';
import 'package:ui_chalenges/views/second_ui_view.dart';
import 'package:ui_chalenges/views/third_ui_view.dart';
import 'package:ui_chalenges/widgets/custom_nav_bar.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  final List<Widget> views = [
    const FirstUiView(),
    const SecondUiView(),
    const ThirdUiView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocConsumer<NavBarCubit, NavBarState>(
        listener: (context, state) {
          if (state is NavBarIndexChanged) {}
        },
        builder: (context, state) {
          return Scaffold(
            body: views[context.read<NavBarCubit>().index],
            bottomNavigationBar: const CustomNavBar(),
          );
        },
      ),
    );
  }
}
