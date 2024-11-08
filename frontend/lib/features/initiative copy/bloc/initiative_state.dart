part of 'initiative_bloc.dart';

sealed class InitiativeState extends Equatable {
  const InitiativeState();
}

class InitiativeStateLoading extends InitiativeState {
  @override
  List<Object?> get props => [];
}

class InitiativeStateLoaded extends InitiativeState {
  const InitiativeStateLoaded({required this.initiative});

  final InitiativeModel initiative;

  @override
  List<Object?> get props => [initiative];
}
