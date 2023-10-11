part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}
final class CartIsLoadin extends CartState {}


final class CartIsEmpty extends CartState {}

final class CartIsNotImpty extends CartState {
  final List<Product>cartModel;

const  CartIsNotImpty(this.cartModel);
}


final class ChangeUi extends CartState {
    final List<Product>cartModel;

 const ChangeUi(this.cartModel);

}


final class RequestIsFailuer extends CartState {
  final String errorMessage;

const   RequestIsFailuer(this.errorMessage);
}


final class AddItemInCart extends CartState {
  final List<Product>cartModel;

const  AddItemInCart(this.cartModel);
}
final class DeletItemFromCart extends CartState {
     final List<Product>cartModel;

 const DeletItemFromCart(this.cartModel);

}





final class ChangeState extends CartState {
  final List<Product>cartModel;

const  ChangeState(this.cartModel);
}
