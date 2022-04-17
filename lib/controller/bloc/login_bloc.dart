import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:xtintas/controller/repository/login_repository.dart';

enum LoginStatus { success, loading, error, empty }

class LoginBlocState {
  final String email;
  final String password;
  final LoginStatus loginStatus;

  LoginBlocState(this.email, this.password, this.loginStatus);

  static LoginBlocState get empty => LoginBlocState('', '', LoginStatus.empty);
  LoginBlocState copyWith(
      {String? email, String? password, LoginStatus? loginStatus}) {
    return LoginBlocState(email ?? this.email, password ?? this.password,
        loginStatus ?? this.loginStatus);
  }
}

class LoginBloc extends Cubit<LoginBlocState> {
  LoginBloc() : super(LoginBlocState.empty);
  AuthRepository authRepository = AuthRepository();

  void getUser({required String email, required String password}) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
  }

  Future<bool> login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      final token = authRepository.getAuth(state.email, state.password);
      await sharedPreferences.setString('token', "Token $token");
      emit(state.copyWith(loginStatus: LoginStatus.success));
      return true;
    } catch (error) {
      emit(state.copyWith(loginStatus: LoginStatus.error));
      return false;
    }
  }
}
