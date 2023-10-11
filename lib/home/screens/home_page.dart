import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/home/manager/bootom/bottom_nav_bar_cubit.dart';
import 'package:shop_app/home/screens/widget/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            S.of(context).shop_app,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
          builder: (context, state) {
            return BlocProvider.of<BottomNavBarCubit>(context)
                .screens[BlocProvider.of<BottomNavBarCubit>(context).index];
          },
        ),
        bottomNavigationBar: const BuildBottomNavBar(),
      ),
    );
  }
}
