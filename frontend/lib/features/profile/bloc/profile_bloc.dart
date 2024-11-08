import 'package:bloc/bloc.dart';
import 'package:frontend/models/api_models/jonogon_api_model.dart';
import 'package:frontend/models/ui_models/jonogon_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileLoading()) {
    on<ProfileInitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
