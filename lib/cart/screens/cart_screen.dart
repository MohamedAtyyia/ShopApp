import 'package:shop_app/cart/screens/widget/custom_list_view_to_show_item_cart.dart';

import '../manager/cart_cubit.dart';
import '../../generated/l10n.dart';
import '../../util/widget/failuer_widget.dart';
import '../../util/widget/list_empty.dart';
import '../../util/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    
     BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is RequestIsFailuer) {
          return FailuerWidget(errorMessage: state.errorMessage);
        } else if ((state is CartIsNotImpty)) {
          return CusotmListView(cartModel: state.cartModel);
        } else if (state is AddItemInCart) {
          return CusotmListView(cartModel: state.cartModel);
        } else if (state is DeletItemFromCart) {
          return CusotmListView(cartModel: state.cartModel);
        } else if (state is CartIsEmpty) {
          return  ListISempty(
              text: S.of(context).cart_is_empty,
              pathImage: 'image/148168d5-6ffa-4f9e-8d22-3c7b7a6430ab.gif');
        } else {
          return const 
          LoadingWidget();

        }
      },
    );
  }
}
