import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/util/model/user_model/user_model.dart';

import '../../../util/api_service.dart';
import '../../../util/app_const.dart';
import '../../../util/error.dart';
import 'home_repo.dart';

class HomeRepoImpleSetting implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpleSetting(this._apiService);

  @override
  Future<Either<Failuer, UserModel>> featchDataofProfile() async {
    try {
      var response = await _apiService.get(endpoint: AppConst.endpointProfile);
      return right(UserModel.fromJson(response.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(
            ServerFailuer('There is Problem${e.response!.data['message']}'));
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
  Future<Either<Failuer, UserModel>> changePassword(
      {required Map<String, dynamic> queryParameters}) async {
    try {
      var response = await _apiService.put(
          endpoint: AppConst.changepassword, queryParameters: queryParameters);
      UserModel userModel = UserModel.fromJson(response.data);
      return right(userModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(
            ServerFailuer('There is ptoblem ${e.response!.data['message']}'));
      } else {
        return left(ServerFailuer('There is ptoblem ${e.toString()}'));
      }
    }
  }
}
