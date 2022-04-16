import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtintas/controller/repository/feedback_repository.dart';

class FeedbackBlocState {
  final int satisfaction;

  FeedbackBlocState(this.satisfaction);
  static FeedbackBlocState get empty => FeedbackBlocState(0);

  FeedbackBlocState copyWith({int? satisfaction}) {
    return FeedbackBlocState(satisfaction ?? this.satisfaction);
  }
}

class FeedbackBloc extends Cubit<FeedbackBlocState> {
  FeedBackRepository feedBackRepository = FeedBackRepository();

  FeedbackBloc() : super(FeedbackBlocState.empty);

  void getRating(int rating) {
    emit(state.copyWith(satisfaction: rating));
    print(rating);
  }

  Future<String> postRating() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final response = await feedBackRepository.postRating(state.satisfaction);
    return response['message'];
  }
}
