import 'package:dio/dio.dart';
import '../shared/shared_prefrence.dart';
import 'app_const.dart';

class ApiService {
  static late Dio dio;
  static void init() {
    dio = Dio(BaseOptions(
        baseUrl: AppConst.baseurl, receiveDataWhenStatusError: true));
  }

  Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    var response = await dio.post(endpoint,
        queryParameters: queryParameters ?? {"": ""},
        options:
            Options(headers: {'lang': MySharedPrefrence.get(key: AppConst.language)??'en', "Authorization": token ?? ""}));
    return response;
  }

  Future<Response> get({required String endpoint}) async {
    return await dio.get(
      endpoint,
      options: Options(
        headers: {
          'lang':  MySharedPrefrence.get(key: AppConst.language) ?? 'en',
          'Content-Type': 'application/json',
          'Authorization': MySharedPrefrence.get(key: AppConst.token)
        },
      ),
    );
  }

  Future<Response> put({
    required String endpoint,
    required Map<String, dynamic> queryParameters,
  }) async {
    Response response = await dio.put(
      endpoint,
      queryParameters: queryParameters,
      options: Options(
        headers: {"Authorization": MySharedPrefrence.get(key: AppConst.token)},
      ),
    );
    return response;
  }
}
