import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/cart/screens/cart_screen.dart';
import 'package:shop_app/favorite/screens/favorit_screen.dart';
import 'package:shop_app/home/screens/widget/all_product.dart';
import 'package:shop_app/settings/screens/settings_screen.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());
  int index = 0;
  List<Widget> screens = [
    const ShowAllProduct(),
    const CartScreen(),
    const FavoritScreen(),
    const SettingScreen()
  ];
  void changebottombar({required int index}) {
    emit(ChangeState());
    this.index = index;
    emit(ChangeScreen());
  }
}
