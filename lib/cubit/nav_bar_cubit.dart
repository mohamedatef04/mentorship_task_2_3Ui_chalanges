import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());

  int index = 0;
  void changeIndex(int newIndex) {
    index = newIndex;
    emit(NavBarIndexChanged());
  }
}
