import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:xtintas/controller/repository/login_repository.dart';

enum LoginStatus { success, loading, error, empty }

class LoginBlocState {

  final LoginStatus loginStatus;

  LoginBlocState(this.loginStatus);

  static LoginBlocState get empty => LoginBlocState( LoginStatus.empty);
  LoginBlocState copyWith(
      {String? email, String? password, LoginStatus? loginStatus}) {
    return LoginBlocState(
        loginStatus ?? this.loginStatus);
  }
}

class LoginBloc extends Cubit<LoginBlocState> {
  LoginBloc() : super(LoginBlocState.empty);
  AuthRepository authRepository = AuthRepository();


  Future<bool> login( {required String email, required String password}) async {

    emit(state.copyWith(loginStatus: LoginStatus.loading));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      final token = authRepository.getAuth(email, password);
      await sharedPreferences.setString('token', "Token $token");
      emit(state.copyWith(loginStatus: LoginStatus.success));
      return true;
    } catch (error) {
      emit(state.copyWith(loginStatus: LoginStatus.error));
      return false;
    }
  }

  Future<bool> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
     emit(state.copyWith(loginStatus: LoginStatus.empty));
    return true;
  }
}
