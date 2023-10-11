part of 'authentication_cubit.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}


final class AuthenticationLoading extends AuthenticationState {}


final class AuthenticationFailuer extends AuthenticationState {
  final String erroMessage;

const  AuthenticationFailuer(this.erroMessage);
}


final class AuthenticationSuccfuly extends AuthenticationState {

  final UserModel userModel;

const   AuthenticationSuccfuly(this.userModel);
}
