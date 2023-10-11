import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../util/model/user_model/user_model.dart';
import 'home_repo.dart';
import '../../../util/api_service.dart';
import '../../../util/error.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);

  @override
  Future<Either<Failuer, UserModel>> authentication(
      {required String endpoint,
      required Map<String, dynamic> queryParameters}) async {
    try {
      var response = await _apiService.post(
          endpoint: endpoint, queryParameters: queryParameters);
      return _returnResult(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer(e.response!.data['message']));
      } else {
        return left(ServerFailuer(e.toString()));
      }
    }
  }

  Either<Failuer, UserModel> _returnResult(Response<dynamic> response) {
      if (response.data['status'] == true && response.statusCode == 200) {
      return right(
        UserModel.fromJson(response.data),
      );
    } else {
      return left(ServerFailuer(response.data['message']));
    }
  }
}
