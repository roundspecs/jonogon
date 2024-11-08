part of 'community_bloc.dart';

@immutable
sealed class CommunityState extends Equatable {}

final class CommunityLoadingState extends CommunityState {
  @override
  List<Object> get props => [];
}

final class CommunityLoadedState extends CommunityState {
  final List<InitiativeModel> initiativeModels;

  CommunityLoadedState({required this.initiativeModels});

  @override
  List<Object> get props => [initiativeModels];
}