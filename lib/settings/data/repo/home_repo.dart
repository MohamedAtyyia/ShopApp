import 'package:dartz/dartz.dart';
import 'package:shop_app/util/model/user_model/user_model.dart';
import '../../../util/error.dart';

abstract class HomeRepo{
  Future<Either<Failuer,UserModel>>featchDataofProfile();

  Future<Either<Failuer,UserModel>>changePassword({required Map<String,dynamic>queryParameters});

} 
