
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/home_model/home_model.dart';
import '../../data/repo/home_repo_imple.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepoImple) : super(HomeInitial());
  final HomeRepoImple _homeRepoImple;
 late HomeModel homeModel ;

  bool isLoading = false; 
  Future<void> featchDataofHome() async {
    isLoading= true ;
    emit(HomeLoadingState());
    
    var result = await _homeRepoImple.featchDataofHome();
    result.fold((l) => emit(HomeFailuerState(l.erroMessage)), (r) {
      homeModel = r;
      emit(HomeSuccessfulyState(r));
    });
  }
  void changeState(){
emit(ChangeState());
  isLoading = false ;
  print('is loading is = $isLoading');
emit(HomeSuccessfulyState(homeModel));
  }

}


