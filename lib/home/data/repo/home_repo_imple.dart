import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../model/home_model/category_model.dart';
import '../model/home_model/home_model.dart';
import 'home_repo.dart';
import '../../../util/api_service.dart';
import '../../../util/app_const.dart';
import '../../../util/error.dart';

class HomeRepoImple implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImple(this._apiService);

  @override
  Future<Either<Failuer, HomeModel>> featchDataofHome() async {
    try {
      var response = await _apiService.get(endpoint: AppConst.endpointHome);
      HomeModel homeModel = HomeModel.fromJson(response.data['data']);
      return right(homeModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer(e.response!.data['message']));
      } else {
        return left(ServerFailuer(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failuer, List<AllCategoriesModel>>> featchDataofCategory() async {
    try {
      var response = await _apiService.get(endpoint: AppConst.endpointCategory);
      List<dynamic> data = response.data['data']['data'];
      List<AllCategoriesModel> categoryModel =
          data.map((e) => AllCategoriesModel.fromJson(e)).toList();
      return right(categoryModel);
    } on Exception catch (e) {
      if(e is DioException ){
        return left(ServerFailuer(e.response!.data['message']));
      }else{
        return left(ServerFailuer(e.toString()));
      }
    }
  }


}
