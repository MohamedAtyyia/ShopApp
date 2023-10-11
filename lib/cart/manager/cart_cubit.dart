import 'package:bloc/bloc.dart';
import 'package:shop_app/util/model/product_model/product.dart';
import '../data/repo/home_repo_imple.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._homeRepoImpleCart) : super(CartInitial());
  final HomeRepoImpleCart _homeRepoImpleCart;
  List<Product> cartModel = [];
  Set<int> cardId = {};
  Future<void> featchAllItemCart() async {
    emit(CartIsLoadin());

    var result = await _homeRepoImpleCart.featchAllItemCart();
    result.fold(
      (l) => emit(
        RequestIsFailuer(l.erroMessage),
      ),
      (r) {
        if (r.isEmpty) {
          emit(CartIsEmpty());
        } else {
          cartModel = r;
          cartModel.forEach((element) {
            cardId.add(element.id!.toInt());
          });
          emit(CartIsNotImpty(cartModel));
        }
      },
    );
  }

  Future<void> addorDeletItemFromCart(
      {required int id, int? index}) async {
    var result = await _homeRepoImpleCart.addorDeletItemFromCart(id: id);

    result.fold(
      (l) => emit(RequestIsFailuer(l.erroMessage)),
      (r)async {
        emit(ChangeState(cartModel));
        if (index != null) {
          cartModel.removeAt(index);
          cardId.remove(r.id);
          if (cartModel.isEmpty) {
            emit(CartIsEmpty());
          } else {
            emit(DeletItemFromCart(cartModel));
          }
        } else {
          print('i am in ');
          cartModel.add(r);
          cardId.add(r.id!);
          emit(AddItemInCart(cartModel));
        }
      },
    );
  }
}
