part of 'setting_cubit.dart';

sealed class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

final class SettingInitial extends SettingState {}

final class SettingLoadinState extends SettingState {}

final class SettingFailuerState extends SettingState {
  final String erroMessage ;

const  SettingFailuerState(this.erroMessage);
}

final class SettingSuccessfulyState extends SettingState {
  final UserModel userModel;

const  SettingSuccessfulyState(this.userModel);

}

final class LogoutSuccessfuly extends SettingState {}

final class LogoutFailuer extends SettingState {
  final String erroMessage;

const   LogoutFailuer(this.erroMessage);
}
