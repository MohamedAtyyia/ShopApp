import 'package:shop_app/home/screens/widget/build_product_image.dart';
import 'package:shop_app/util/app_router.dart';
import 'package:shop_app/util/model/product_model/product.dart';
import 'price_and_favorit.dart';
import 'package:flutter/material.dart';
class ItemGridView extends StatelessWidget {
  const ItemGridView({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.pushNamed(context, AppRouter.detailsScreen,arguments: product),
      child: Container(
                color: Colors.white,
    
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BuildProductImag(
              image: product.image.toString(),
              discount: product.discount!.toInt(),
              height: MediaQuery.of(context).size.height * .2,
              width: MediaQuery.of(context).size.height * .2,
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  PriceAndFavoritWidget(
                      price: product.price!.toInt(),
                      discount: product.discount!.toInt(),
                      oldPrice: product.oldPrice!.toInt(),
                      id: product.id!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
