import 'package:flutter/material.dart';
import 'package:shop_app/cart/screens/widget/bottom_delet.dart';
import 'package:shop_app/home/screens/widget/build_product_image.dart';
import 'package:shop_app/home/screens/widget/price_and_favorit.dart';
import 'package:shop_app/util/model/product_model/product.dart';


class ItemCart extends StatelessWidget {
  const ItemCart(
      {super.key, required this.dataofProductCart, required this.index});
  final Product dataofProductCart;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              BuildProductImag(
                image: dataofProductCart.image.toString(),
                discount: dataofProductCart.discount!.toInt(),
                height: 90,
                width: 90,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataofProductCart.name.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    PriceAndFavoritWidget(
                      price: dataofProductCart.price!.toInt(),
                      discount: dataofProductCart.discount!.toInt(),
                      oldPrice: dataofProductCart.oldPrice!.toInt(),
                      id: dataofProductCart.id!.toInt(),
                    )
                  ],
                ),
              )
            ],
          ),
          CustomBottomTODeletItemFromCart(id: dataofProductCart.id!.toInt(),index: index),
          const Divider(
            thickness: .5,
          )
        ],
      ),
    );
  }
}

