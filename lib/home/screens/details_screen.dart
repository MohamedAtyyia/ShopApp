import 'package:shop_app/home/screens/widget/details_screen_body.dart';
import 'package:shop_app/util/model/product_model/product.dart';

import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.dataofProduct});
  final Product dataofProduct;

  @override
  Widget build(BuildContext context) {
    return
     SafeArea(
       child: Scaffold(
           body:
           
            DetailsScreenBody(
             dataofProduct: dataofProduct,
           ),
           ),
     ); 
      
    
  }
}



