import 'package:shop_app/cart/screens/widget/item_cart.dart';
import 'package:shop_app/util/model/product_model/product.dart';

import 'package:flutter/material.dart';

class CusotmListView extends StatelessWidget {
  const CusotmListView({super.key, required this.cartModel});
  final List<Product> cartModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartModel.length,
            itemBuilder: (context, index) => ItemCart(dataofProductCart: cartModel[index],index: index,)
          ),
        ),
       
        
      ],
    );
  }

  
}
