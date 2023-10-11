import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cart/manager/cart_cubit.dart';
import 'package:shop_app/util/flutter_tost.dart';
import 'package:shop_app/util/model/product_model/product.dart';

import '../../../generated/l10n.dart';
import 'build_smoth_image.dart';
import 'price_and_favorit.dart';
import 'package:flutter/material.dart';

import '../../../util/widget/custom_bottom.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key, required this.dataofProduct});
  final Product dataofProduct;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildSmothImage(
              images: dataofProduct.images!.toList(),
              controller: PageController(),
            ),
            Text(
              dataofProduct.description.toString(),
              maxLines: 14,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    height: 1.5, // زيادة المسافة بين الأسطر
                  ),

            ),
            PriceAndFavoritWidget(
                price: dataofProduct.price!.toInt(),
                discount: dataofProduct.discount!.toInt(),
                oldPrice: dataofProduct.oldPrice!.toInt(),
                id: dataofProduct.id!),
            const SizedBox(
              height: 12,
            ),
            Custombottom(
              text: S.of(context).add_to_cart,
              ontap: () async {
                if (BlocProvider.of<CartCubit>(context)
                    .cardId
                    .contains(dataofProduct.id)) {
                  flutterToast(message: S.of(context).product_in_cart);
                } else {
                  await BlocProvider.of<CartCubit>(context)
                      .addorDeletItemFromCart(id: dataofProduct.id!.toInt());
                  flutterToast(message: S.of(context).product_add_cart);
                }
              },
            ),
             const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}
