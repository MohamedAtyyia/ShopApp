import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_password_state.dart';

class ShowPasswordCubit extends Cubit<ShowPasswordState> {
  ShowPasswordCubit() : super(ShowPasswordInitial());
  List<bool>isShow= [true,true,true,true];
  void showPassword(int index) {
    emit(ChangeState());

     isShow[index] = !isShow[index];
     print(isShow[index]);
    isShow[index] == true ? emit(HidePassword()) : emit(ShowPassowrd());
  }

 
}
