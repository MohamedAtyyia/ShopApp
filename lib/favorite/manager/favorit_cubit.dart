import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/favorite/data/repo/home_repo_imple.dart';
import 'package:shop_app/util/model/product_model/product.dart';

part 'favorit_state.dart';

class FavoritCubit extends Cubit<FavoritState> {
  FavoritCubit(this._homeRepoImpleFavorit) : super(FavoritInitial());
  final HomeRepoImpleFavorit _homeRepoImpleFavorit;
  List<Product> favoritModel = [];
  Set<int> favoritId = {};

  Future<void> featchAllItemFavorite() async {
    favoritModel.clear();
    var result = await _homeRepoImpleFavorit.featchAllItemFavorite();

    result.fold(
      (l) => emit(RequestIsFailuer(l.erroMessage)),
      (r) {
        favoritModel = r;
        r.forEach((e) {
          favoritId.add(e.id!);
        });
        _emitState(r);
      },
    );
  }

  Future<void> addAndDeletItemFromFavorit({required int id}) async {
    var result = await _homeRepoImpleFavorit.addAndDeletItemFromFavorit(id: id);
    result.fold(
        (l) => emit(
              RequestIsFailuer(l.erroMessage),
            ), (r) async {
      if (favoritId.contains(id)) {
        favoritId.remove(id);        
      } else {
        favoritId.add(id);
      }
      await featchAllItemFavorite();
      if (favoritId.isEmpty) {
        emit(FavoritIsEmpty());
      } else {
        emit(AddItemInFavorit());
      }
    });
  }

  void _emitState(List<Product> r) {
    if (r.isEmpty) {
      emit(FavoritIsEmpty());
    } else {
      emit(FavoritIsNotEmpty());
    }
  }
}
