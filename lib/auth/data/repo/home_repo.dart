import 'package:dartz/dartz.dart';
import '../../../util/model/user_model/user_model.dart';
import '../../../util/error.dart';

abstract class HomeRepo {
  Future<Either<Failuer, UserModel>> authentication(
      {required String endpoint,
      required Map<String, dynamic> queryParameters});
}
