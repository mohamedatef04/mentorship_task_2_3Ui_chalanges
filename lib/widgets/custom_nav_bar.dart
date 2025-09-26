import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ui_chalenges/cubit/nav_bar_cubit.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: Colors.transparent,
      tabMargin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      haptic: true, // haptic feedback
      tabBorderRadius: 30,
      curve: Curves.easeIn, // tab animation curves
      duration: const Duration(milliseconds: 200), // tab animation duration
      gap: 8, // the tab button gap between icon and text
      color: Colors.grey[800], // unselected icon color

      iconSize: 20, // tab button icon size
      tabBackgroundColor: Colors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      onTabChange: (value) {
        context.read<NavBarCubit>().changeIndex(value);
      }, // navigation bar padding
      tabs: const [
        GButton(
          icon: Icons.numbers,

          text: 'Ui_1',
          textColor: Colors.white,
        ),
        GButton(
          icon: Icons.numbers,

          text: 'Ui_2',
        ),
        GButton(
          icon: Icons.numbers,

          text: 'Ui_3',
        ),
      ],
    );
  }
}
