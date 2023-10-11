import 'package:dartz/dartz.dart';
import '../model/home_model/category_model.dart';
import '../model/home_model/home_model.dart';
import '../../../util/error.dart';

abstract class HomeRepo{
  Future<Either<Failuer,HomeModel>>featchDataofHome();

  Future<Either<Failuer,List<AllCategoriesModel>>>featchDataofCategory();

}