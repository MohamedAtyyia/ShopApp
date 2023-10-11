part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}
final class CategoryLoadingState extends CategoryState {}
final class CategoryFailuerState extends CategoryState {
  final String erroMessage;

const   CategoryFailuerState(this.erroMessage);
}
final class CategorySuccessfulyState extends CategoryState {
  final List<AllCategoriesModel>categories;

const  CategorySuccessfulyState(this.categories);
}
