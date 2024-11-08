import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:frontend/frontend.dart';
import 'package:frontend/models/ui_models/initiative_model.dart';
import 'package:frontend/models/ui_models/jonogon_model.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityBloc() : super(CommunityLoadingState()) {
    on<CommunitInit>((event, emit) {
      emit(
        CommunityLoadedState(initiativeModels: [
          InitiativeModel(
            id: 1.toString(),
            author: JonogonModel(
              id: 2.toString(),
              username: 'Adid',
              fullName: 'Adid Rahman',
              mobileNumber: '01222222222',
              imageURL:
                  'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?semt=ais_hybrid',
            ),
            imageURL:
                'https://cdn.pixabay.com/photo/2017/09/08/18/20/garbage-2729608_640.jpg',
            createdAt: DateTime(2021, 10, 10),
            description: 'Description',
            solution: 'Solution',
            steps: const ['Step 1', 'Step 2'],
            appreciateCount: 10,
            isImIn: true,
            didUserAppreciate: true,
          ),
          InitiativeModel(
            id: 2.toString(),
            author: JonogonModel(
              id: 2.toString(),
              username: 'Zarif',
              fullName: 'Zarif Muhtasim',
              mobileNumber: '01222222222',
              imageURL:
                  'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?semt=ais_hybrid',
            ),
            imageURL:
                'https://cdn.pixabay.com/photo/2017/09/08/18/20/garbage-2729608_640.jpg',
            createdAt: DateTime(2021, 10, 10),
            description: 'Description',
            solution: 'Solution',
            steps: const ['Step 1', 'Step 2'],
            appreciateCount: 10,
          ),
        ]),
      );
    });

    // on<CommunityInitiativeAppreciateToggled>((event, emit) {
    //   emit(
    //     state.copyWith(
    //       posts: state.posts.map((post) {
    //         if (post.id == event.postId) {
    //           return post.copyWith(
    //             appreciateCount:
    //                 post.appreciateCount + (post.didUserAppreciate ? -1 : 1),
    //             didUserAppreciate: !post.didUserAppreciate,
    //           );
    //         }
    //         return post;
    //       }).toList(),
    //     ),
    //   );
    // });

    // on<CommunityImInToggled>((event, emit) {
    //   emit(
    //     state.copyWith(
    //       posts: state.posts.map((post) {
    //         if (post.id == event.postId) {
    //           return post.copyWith(
    //             iAmInCount: post.iAmInCount + (post.isImIn ? -1 : 1),
    //             isImIn: !post.isImIn,
    //           );
    //         }
    //         return post;
    //       }).toList(),
    //     ),
    //   );
    // });

    // on<CommunityInitiativeCommentToggled>((event, emit) {
    //   emit(
    //     state.copyWith(
    //       posts: state.posts.map((post) {
    //         if (post.id == event.postId) {
    //           return post.copyWith(showComment: !post.showComment);
    //         }
    //         return post;
    //       }).toList(),
    //     ),
    //   );
    // });
  }
}
