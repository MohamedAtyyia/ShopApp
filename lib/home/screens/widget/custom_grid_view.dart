import 'package:flutter/material.dart';
import 'package:shop_app/util/model/product_model/product.dart';

import 'item_grid_view.dart';


class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.product});
  final List<Product> product;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(.4),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
            childAspectRatio: 1 / 1.4),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: product.length,
        itemBuilder: (context, index) =>ItemGridView(product: product[index]),
        ),
      );

      // child: ItemGridView(product: product[index]))),
    
  }
}

