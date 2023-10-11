import 'package:bloc/bloc.dart';
import '../../../util/model/user_model/user_model.dart';
import '../../data/repo/home_repo_imple.dart';
import 'package:equatable/equatable.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this._homeRepoImpl) : super(AuthenticationInitial());

  final HomeRepoImpl _homeRepoImpl;
  Future<void> authentication(
      {required String endpoint,
      required Map<String, dynamic> queryParameters}) async {
        emit(AuthenticationLoading());
    var result = await _homeRepoImpl.authentication(
        endpoint: endpoint, queryParameters: queryParameters);
    result.fold(
      (l) => emit(AuthenticationFailuer(l.erroMessage)),
      (r) => emit(
        AuthenticationSuccfuly(r),
      ),
    );
  }
}
