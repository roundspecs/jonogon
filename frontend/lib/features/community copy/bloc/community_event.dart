part of 'community_bloc.dart';

@immutable
sealed class CommunityEvent {}

final class CommunityInitiativeAppreciateToggled extends CommunityEvent {
  CommunityInitiativeAppreciateToggled(this.postId);
  final String postId;
}

final class CommunityImInToggled extends CommunityEvent {
  CommunityImInToggled(this.postId);
  final String postId;
}

final class CommunityInitiativeCommentToggled extends CommunityEvent {
  CommunityInitiativeCommentToggled(this.postId);
  final String postId;
}
