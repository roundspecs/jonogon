import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/api_repository/initiative_api.dart';
import 'package:frontend/models/ui_models/initiative_model.dart';

part 'initiative_event.dart';
part 'initiative_state.dart';

class InitiativeBloc extends Bloc<InitiativeEvent, InitiativeState> {
  InitiativeBloc() : super(InitiativeStateLoading()) {
    on<InitiativeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<InitiativeEventsLoad>(_initiativeEventsLoad);
  }
}

Future<void> _initiativeEventsLoad(
  InitiativeEventsLoad event,
  Emitter<InitiativeState> emit,
) async {
  final initiativeApiModel = await InitiativeApi.getInitiativesById(event.idI);
  final initiative =
      InitiativeModel.fromApiModel(model: initiativeApiModel, idJ: event.idJ);
  emit(InitiativeStateLoaded(initiative: initiative));
}
