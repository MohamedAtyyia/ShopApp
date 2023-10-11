import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/util/model/product_model/product.dart';
import 'home_repo.dart';
import '../../../shared/shared_prefrence.dart';
import '../../../util/api_service.dart';
import '../../../util/app_const.dart';
import '../../../util/error.dart';

class HomeRepoImpleFavorit implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpleFavorit(this._apiService);

  @override
  Future<Either<Failuer, List<Product>>> featchAllItemFavorite() async {
    try {
      var response = await _apiService.get(endpoint: AppConst.endpointfavorit);
      List<dynamic> data = response.data['data']['data'];
      List<Product> favoritModel =
          data.map((e) => Product.fromJson(e['product'])).toList();
      return right(favoritModel);
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
  Future<Either<Failuer, Response>> addAndDeletItemFromFavorit(
      {required int id}) async {
    try {
      var response = await _apiService.post(
          endpoint: AppConst.endpointfavorit,
          queryParameters: {"product_id": id},
          token: MySharedPrefrence.get(key: AppConst.token));
      return right(response);
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
