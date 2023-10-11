import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/home/manager/home_cubit/home_cubit.dart';
import 'package:shop_app/home/screens/widget/build_screen.dart';
import 'package:shop_app/util/widget/failuer_widget.dart';
import 'package:shop_app/util/widget/loading_widget.dart';

class ShowAllProduct extends StatelessWidget {
  const ShowAllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return    BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeFailuerState) {
          return FailuerWidget(errorMessage: state.errorMessage);
        } else if (state is HomeSuccessfulyState) {
          BlocProvider.of<HomeCubit>(context).isLoading =false;
          return BuildScreen(
            banners: state.homeModel.banners!.toList(),
            product: state.homeModel.products!.toList(),
          );
        } else {
          return const LoadingWidget();
        }
      },
    );}
}


