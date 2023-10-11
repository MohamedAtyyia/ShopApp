import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/home_model/category_model.dart';
import '../../data/repo/home_repo_imple.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._homeRepoImple) : super(CategoryInitial());
  final HomeRepoImple _homeRepoImple;
  Future<void> featchDataofCategory() async {
    emit(CategoryLoadingState());
    var result = await _homeRepoImple.featchDataofCategory();
    result.fold(
      (l) => emit(CategoryFailuerState(l.erroMessage)),
      (r) => emit(
        CategorySuccessfulyState(r),
      ),
    );
  }
}
