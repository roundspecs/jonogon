part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class ProfileInitEvent extends ProfileEvent {
  ProfileInitEvent({required this.id});
  final int id;
}