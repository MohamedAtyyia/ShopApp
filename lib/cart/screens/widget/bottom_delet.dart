import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../util/flutter_tost.dart';
import '../../manager/cart_cubit.dart';

class CustomBottomTODeletItemFromCart extends StatelessWidget {
  const CustomBottomTODeletItemFromCart({super.key, required this.id, required this.index});
final int id;
final int index;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    onPressed: () async {
               await  BlocProvider.of<CartCubit>(context).addorDeletItemFromCart(
                    id: id.toInt(), index: index);
                    flutterToast(message: S.of(context).product_deleted_from_cart);
              },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff01BE84),
        padding:const  EdgeInsets.symmetric(horizontal: 22,vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26)
        )
      ),
      child: Text(
        'Remove',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
