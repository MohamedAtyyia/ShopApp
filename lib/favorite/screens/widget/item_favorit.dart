import 'package:flutter/material.dart';
import 'package:shop_app/home/screens/widget/build_product_image.dart';
import 'package:shop_app/home/screens/widget/price_and_favorit.dart';
import 'package:shop_app/util/model/product_model/product.dart';



class ItemFavorit extends StatelessWidget {
  const ItemFavorit({super.key, required this.favoritModel});
  final Product favoritModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Row(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildProductImag(
                image: favoritModel.image.toString(),
                discount: favoritModel.discount!.toInt(),
                width: MediaQuery.of(context).size.height * .1,
                height: MediaQuery.of(context).size.height * .242,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favoritModel.name.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    PriceAndFavoritWidget(
                        price: favoritModel.price!.toInt(),
                        discount: favoritModel.discount!.toInt(),
                        oldPrice: favoritModel.oldPrice!.toInt(),
                        id: favoritModel.id!.toInt())
                    ,
                  ],
                  
                ),
              )
            ],
          ),
   

          const Divider(thickness: .5)
        ],
      ),
    );
  }
}
