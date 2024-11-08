part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  ProfileLoaded({required this.jonogon});
  final JonogonModel jonogon;
}
