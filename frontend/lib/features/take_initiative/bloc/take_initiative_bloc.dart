import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'take_initiative_event.dart';
part 'take_initiative_state.dart';

class TakeInitiativeBloc extends Bloc<TakeInitiativeEvent, TakeInitiativeState> {
  TakeInitiativeBloc() : super(TakeInitiativeInitial()) {
    on<TakeInitiativeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
