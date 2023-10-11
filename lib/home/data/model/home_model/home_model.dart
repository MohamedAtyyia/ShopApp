import 'package:equatable/equatable.dart';
import 'package:shop_app/util/model/product_model/product.dart';

import 'banner.dart';
class HomeModel extends Equatable {
	final List<Banners>? banners;
	final List<Product>? products;
	final String? ad;

	const HomeModel({this.banners, this.products, this.ad});

	factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
				banners: (json['banners'] as List<dynamic>?)
						?.map((e) => Banners.fromJson(e as Map<String, dynamic>))
						.toList(),
				products: (json['products'] as List<dynamic>?)
						?.map((e) => Product.fromJson(e as Map<String, dynamic>))
						.toList(),
            
				ad: json['ad'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'banners': banners?.map((e) => e.toJson()).toList(),
				'products': products?.map((e) => e.toJson()).toList(),
				'ad': ad,
			};

	@override
	List<Object?> get props => [banners, products, ad];
}
