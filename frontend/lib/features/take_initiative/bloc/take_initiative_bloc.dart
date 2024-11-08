
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'take_initiative_event.dart';
part 'take_initiative_state.dart';

class TakeInitiativeBloc extends Bloc<TakeInitiativeEvent, TakeInitiativeState> {
  TakeInitiativeBloc() : super(TakeInitiativeInitial()) {
    on<TakeInitiativeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
