import 'package:dartz/dartz.dart';
import 'package:shop_app/util/model/product_model/product.dart';
import '../../../util/error.dart';

abstract class HomeRepo{
  Future<Either<Failuer,List<Product>>>featchAllItemCart();

  Future<Either<Failuer,Product>>addorDeletItemFromCart({required int id});


}