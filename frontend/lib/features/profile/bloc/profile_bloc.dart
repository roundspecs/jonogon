import 'package:bloc/bloc.dart';
import 'package:frontend/models/ui_models/jonogon_model.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileLoading()) {
    on<ProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
