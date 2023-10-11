import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/favorite/manager/favorit_cubit.dart';
import 'package:shop_app/generated/l10n.dart';
import 'package:shop_app/util/flutter_tost.dart';


class PriceAndFavoritWidget extends StatelessWidget {
  const PriceAndFavoritWidget({
    super.key,
    required this.price,
    required this.discount,
    required this.oldPrice,
    required this.id,
  });
  final int price;
  final int discount;

  final int oldPrice;

  final int id;

  @override
  Widget build(BuildContext context) {
     final cubit = BlocProvider.of<FavoritCubit>(context);
    return Row(
      children: [
        Text(
          price.toInt().toString(),
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.lightBlue),
        ),
        const SizedBox(
          width: 16
        ),
        discount != 0
            ? Text(
                oldPrice.toInt().toString(),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.lineThrough,
                    ),
              )
            : Container(),
        const Spacer(
          flex: 1
        ),
        InkWell(
          onTap: () async {
            await cubit.addAndDeletItemFromFavorit(id: id);
            if (cubit.favoritId.contains(id)) {
              flutterToast(message:S.of(context).product_add_favorit);
            } else {
              flutterToast(message: S.of(context).product_deleted_from_favorit);
            }
          },
          child:
              
            //Icon(Icons.favorite,color: Colors.grey)
              BlocBuilder<FavoritCubit, FavoritState>(
            builder: (context, state) {
              return Icon(
                Icons.favorite,
                size: 24,
                color: BlocProvider.of<FavoritCubit>(context)
                        .favoritId
                        .contains(id)
                    ? Colors.red
                    : Colors.grey,
              );
            },
          ),
        ),
        const SizedBox(width: 6)
      ],
    );
  }
}
