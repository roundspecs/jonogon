part of 'initiative_bloc.dart';

sealed class InitiativeEvent extends Equatable {
  const InitiativeEvent();

  @override
  List<Object> get props => [];
}

class InitiativeEventsLoad extends InitiativeEvent {
  const InitiativeEventsLoad ({required this.idI, required this.idJ});
  final int idI;
  final int idJ;
  
  @override
  List<Object> get props => [idI, idJ];
}

