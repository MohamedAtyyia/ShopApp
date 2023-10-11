import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/util/model/product_model/product.dart';
import 'home_repo.dart';
import '../../../shared/shared_prefrence.dart';
import '../../../util/api_service.dart';
import '../../../util/app_const.dart';
import '../../../util/error.dart';

class HomeRepoImpleCart implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpleCart(this._apiService);

  @override
  Future<Either<Failuer, List<Product>>> featchAllItemCart() async {
    try {
      var response = await _apiService.get(endpoint: AppConst.endpointCart);
      List<dynamic> data = response.data['data']['cart_items'];
      List<Product> cartModel =
          data.map((e) => Product.fromJson(e['product'])).toList();
      return right(cartModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer(e.response!.data['message']));
      } else {
        return left(
          ServerFailuer(
            e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failuer, Product>> addorDeletItemFromCart(
      {required int id}) async {
    try {
      var response = await _apiService.post(
          endpoint: AppConst.endpointCart,
          queryParameters: {
            "product_id": id,
          },
          token: MySharedPrefrence.get(key: AppConst.token));
      Product cartModel = Product.fromJson(response.data['data']['product']);
      return right(cartModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailuer(e.response!.data['message']));
      } else {
        return left(
          ServerFailuer(
            e.toString(),
          ),
        );
      }
    }
  }
}
