import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/settings/data/repo/home_repo_imple.dart';
import 'package:shop_app/util/model/user_model/user_model.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this._homeRepoImple) : super(SettingInitial());
  final HomeRepoImpleSetting _homeRepoImple;
  UserModel? userModel;

  Future<void> featchDataofProfile() async {
    emit(SettingLoadinState());
    var result = await _homeRepoImple.featchDataofProfile();
    result.fold((l) => emit(SettingFailuerState(l.erroMessage)), (r) {
      userModel = r;
      emit(SettingSuccessfulyState(r));
    });
  }

  Future<void> changePassword(
      {required Map<String, dynamic> queryParameters}) async {
    emit(SettingLoadinState());
    var result =
        await _homeRepoImple.changePassword(queryParameters: queryParameters);
    result.fold(
      (l) => emit(
        SettingFailuerState(l.erroMessage),
      ),
      (r) => emit(
        SettingSuccessfulyState(r),
      ),
    );
  }
}
