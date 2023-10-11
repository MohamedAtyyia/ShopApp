import 'package:flutter/material.dart';
import 'package:shop_app/favorite/screens/widget/item_favorit.dart';
import 'package:shop_app/util/model/product_model/product.dart';


class CustomLisView extends StatelessWidget {
  const CustomLisView({super.key, required this.favoritModel});
  final List<Product> favoritModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: favoritModel.length,
        itemBuilder: (contex, index) =>
            ItemFavorit(favoritModel: favoritModel[index]));
  }
}

