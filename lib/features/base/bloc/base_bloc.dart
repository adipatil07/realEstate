import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'base_event.dart';
part 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(BaseInitial()) {
    on<UpdateBottomNavEvent>((event, emit) {
      emit(BaseUpdated(index: event.index));
    });
  }
}