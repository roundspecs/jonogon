import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:frontend/frontend.dart';
import 'package:frontend/models/ui_models/initiative_model.dart';
import 'package:frontend/models/ui_models/jonogon_model.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityBloc() : super(CommunityState.initial()) {
    //TODO: CommunityState.final() should be the constructor
    on<CommunityInitiativeAppreciateToggled>((event, emit) {
      emit(
        state.copyWith(
          posts: state.posts.map((post) {
            if (post.id == event.postId) {
              return post.copyWith(
                appreciateCount:
                    post.appreciateCount + (post.didUserAppreciate ? -1 : 1),
                didUserAppreciate: !post.didUserAppreciate,
              );
            }
            return post;
          }).toList(),
        ),
      );
    });

    on<CommunityImInToggled>((event, emit) {
      emit(
        state.copyWith(
          posts: state.posts.map((post) {
            if (post.id == event.postId) {
              return post.copyWith(
                iAmInCount: post.iAmInCount + (post.isImIn ? -1 : 1),
                isImIn: !post.isImIn,
              );
            }
            return post;
          }).toList(),
        ),
      );
    });

    on<CommunityInitiativeCommentToggled>((event, emit) {
      emit(
        state.copyWith(
          posts: state.posts.map((post) {
            if (post.id == event.postId) {
              return post.copyWith(showComment: !post.showComment);
            }
            return post;
          }).toList(),
        ),
      );
    });
  }
}
