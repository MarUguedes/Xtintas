import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtintas/controller/repository/doubt_repository.dart';
import 'package:xtintas/controller/repository/feedback_repository.dart';

class DoubtBlocState {
  final String question;

  DoubtBlocState(this.question);
  static DoubtBlocState get empty => DoubtBlocState('');

  DoubtBlocState copyWith({String? question}) {
    return DoubtBlocState(question ?? this.question);
  }
}

class DoubtBloc extends Cubit<DoubtBlocState> {
  DoubtRepository doubtRepository = DoubtRepository();

  DoubtBloc() : super(DoubtBlocState.empty);

  void getQuestion(String question) {
    emit(state.copyWith(question: question));
  }

  Future postQuestion() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final response = await doubtRepository.postQuestion(state.question);
    print(response);
    return response['message'];
  }
}
