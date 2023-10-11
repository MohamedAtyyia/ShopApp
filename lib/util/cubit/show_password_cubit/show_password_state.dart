part of 'show_password_cubit.dart';

sealed class ShowPasswordState extends Equatable {
  const ShowPasswordState();

  @override
  List<Object> get props => [];
}

final class ShowPasswordInitial extends ShowPasswordState {}
final class ShowPassowrd extends ShowPasswordState {}

final class HidePassword extends ShowPasswordState {}
final class ChangeState extends ShowPasswordState {}
