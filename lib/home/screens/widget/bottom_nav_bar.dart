import 'package:shop_app/home/manager/bootom/bottom_nav_bar_cubit.dart';

import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class BuildBottomNavBar extends StatelessWidget {
  const BuildBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            BlocProvider.of<BottomNavBarCubit>(context)
                .changebottombar(index: index);
          },
          currentIndex: BlocProvider.of<BottomNavBarCubit>(context).index,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items:  [
            BottomNavigationBarItem(label: S.of(context).home, icon:const  Icon(Icons.home)),
            BottomNavigationBarItem(
                label: S.of(context).cart, icon:const Icon(Icons.shopping_cart)),
            BottomNavigationBarItem(
                label: S.of(context).favorite, icon:const Icon(Icons.favorite)),
            BottomNavigationBarItem(
                label: S.of(context).settings, icon:const Icon(Icons.settings)),
          ],
        );
     
      },
    );
  }
}
