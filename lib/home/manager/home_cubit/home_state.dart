part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeFailuerState extends HomeState {
  final String errorMessage;

const  HomeFailuerState(this.errorMessage);
}

final class HomeSuccessfulyState extends HomeState {
  final HomeModel homeModel
  ;

  const HomeSuccessfulyState(this.homeModel);
}



final class ChangeState extends HomeState {}

//ChangeState