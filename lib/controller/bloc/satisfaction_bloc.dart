import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtintas/controller/repository/satisfaction_repository.dart';
import 'package:xtintas/controller/repository/satisfaction_repository.dart';

class SatisfactionBlocState {
  final int satisfaction;

  SatisfactionBlocState(this.satisfaction);
  static SatisfactionBlocState get empty => SatisfactionBlocState(0);

  SatisfactionBlocState copyWith({int? satisfaction}) {
    return SatisfactionBlocState(satisfaction ?? this.satisfaction);
  }
}

class SatisfactionBloc extends Cubit<SatisfactionBlocState> {
  SatisfactionRepository satisfactionRepository = SatisfactionRepository();

  SatisfactionBloc() : super(SatisfactionBlocState.empty);

  void getRating(int rating) {
    emit(state.copyWith(satisfaction: rating));
    
  }

  Future<String> postRating() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final response = await satisfactionRepository.postRating(state.satisfaction);
    return response['message'];
  }
}
