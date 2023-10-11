import 'package:shop_app/home/screens/widget/build_category.dart';
import 'package:shop_app/home/screens/widget/build_cerosil_slider.dart';
import 'package:shop_app/home/screens/widget/custom_grid_view.dart';
import 'package:shop_app/util/model/product_model/product.dart';

import '../../../generated/l10n.dart';
import 'text_info.dart';
import 'package:flutter/material.dart';

import '../../data/model/home_model/banner.dart';

class BuildScreen extends StatelessWidget {
  const BuildScreen({super.key, required this.banners, required this.product});
  final List<Banners> banners;
  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: BuildCaroiselSlider(banners: banners),
          ),
           TextInfo(text: S.of(context).all_catefory),
          const BuildAllCategories(),
           TextInfo(text: S.of(context).all_product),
          CustomGridView(product: product),
        ],
      ),
    );
  }

//
}
