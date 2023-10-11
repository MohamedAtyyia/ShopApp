part of 'favorit_cubit.dart';

sealed class FavoritState extends Equatable {
  const FavoritState();

  @override
  List<Object> get props => [];
}

final class FavoritInitial extends FavoritState {}

final class RequestIsFailuer extends FavoritState {
  final String errorMessage;

const   RequestIsFailuer(this.errorMessage);

}
 final class FavoritIsEmpty extends FavoritState {}

final class FavoritIsNotEmpty extends FavoritState {}


final class AddItemInFavorit extends FavoritState {}
