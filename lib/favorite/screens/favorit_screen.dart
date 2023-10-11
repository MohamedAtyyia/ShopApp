import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/favorite/manager/favorit_cubit.dart';
import 'package:shop_app/favorite/screens/widget/custom_list_view_to_show_all_favorit.dart';

import '../../generated/l10n.dart';
import '../../util/widget/failuer_widget.dart';
import '../../util/widget/list_empty.dart';

class FavoritScreen extends StatelessWidget {
  const FavoritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritCubit, FavoritState>(
      builder: (context, state) {
        if (state is RequestIsFailuer) {
          return FailuerWidget(errorMessage: state.errorMessage);
        } else if (state is FavoritIsNotEmpty || state is AddItemInFavorit ) {
          return CustomLisView(
              favoritModel:
                  BlocProvider.of<FavoritCubit>(context).favoritModel);
        } else  {
          return  ListISempty(
                  text: S.of(context).favorit_is_empty,
              pathImage: 'image/7f4d612a-e4b4-4db6-929c-d1ac6314c6d0.gif');
        } 
       
      },
    );
  }
}
