import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/shared/shared_prefrence.dart';
import 'package:shop_app/util/app_const.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());
  bool isArabic = MySharedPrefrence.get(key: AppConst.isarabic) ?? false;
  String language = MySharedPrefrence.get(key: AppConst.language) ?? 'en';
  bool isLoading = false;
  Future<void> changeLanguage({ bool? openApp}) async {

    print('asd');
    emit(ChangeState());

    if (openApp != null) {
      emit(LanguageIsEnglisgh());
    } else {
      isArabic = !isArabic;
      MySharedPrefrence.setData(key: AppConst.isarabic, value: isArabic);
      if (isArabic) {
        language = 'ar';
        MySharedPrefrence.setData(key: AppConst.language, value: language);

        emit(LanguageIsArabic());
      } else {
        language = 'en';
        MySharedPrefrence.setData(key: AppConst.language, value: language);
        emit(LanguageIsEnglisgh());
      }
    }
  }

 

  bool isEnglish() {
    return Intl.getCurrentLocale() == 'en';
  }

  void startLoading(bool isLoading){
    emit(ChangeState());
    this.isLoading = isLoading;
    //(StopLaoding());
  }

}
