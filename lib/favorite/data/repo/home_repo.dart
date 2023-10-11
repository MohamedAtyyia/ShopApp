import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/util/model/product_model/product.dart';
import '../../../util/error.dart';

abstract class HomeRepo{
  Future<Either<Failuer,List<Product>>>featchAllItemFavorite();
  Future<Either<Failuer,Response>>addAndDeletItemFromFavorit({required int id });

}