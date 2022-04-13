import 'package:bloc/bloc.dart';
import 'package:xtintas/controller/repository/ink_repository.dart';
import 'package:xtintas/models/ink.dart';

class BlocInkState {
  final List<Ink> inks;
  final StatusInk status;
  

  BlocInkState(this.inks, this.status);
  static BlocInkState get empty => BlocInkState([], StatusInk.empty);

  BlocInkState copyWith({List<Ink>? inks, StatusInk? status}) {
    return BlocInkState(inks ?? this.inks, status ?? this.status);
  }
}

enum StatusInk { loading, error, success, empty }

class BlocInk extends Cubit<BlocInkState> {
  BlocInk(BlocInkState initialState) : super(BlocInkState.empty);

  InkRepository repository = InkRepository();

  void getInks() async {
    emit(state.copyWith(status: StatusInk.loading));

    try {
      final response = await repository.getInk();
      emit(state.copyWith(inks: response, status: StatusInk.success));
    } catch (error) {
      emit(state.copyWith(status: StatusInk.error));
    }
    state.inks.forEach(
      (element) => print('${element.name}'),
      
    );
  }
}
