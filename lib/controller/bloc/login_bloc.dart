import 'package:bloc/bloc.dart';
import 'package:xtintas/controller/repository/repository.dart';

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
  LoginBloc(LoginBlocState initialState) : super(LoginBlocState.empty);
  AuthRepository authRepository = AuthRepository();

  void getUser({required String email, required String password}) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    try {
      final response = await authRepository.getAuth(email, password);
      emit(state.copyWith(loginStatus: LoginStatus.success));
    } catch (error) {
      emit(state.copyWith(loginStatus: LoginStatus.error));
    }
  }
}
