import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/api_repository/initiative_api.dart';
// import 'package:frontend/frontend.dart';
import 'package:frontend/models/ui_models/initiative_model.dart';
import 'package:frontend/models/ui_models/jonogon_model.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityBloc() : super(CommunityLoadingState()) {
    on<CommunitInit>((event, emit) async {
      final initiativeApiModels = await InitiativeApi.getAllInitiatives();
      final initiativeModel = initiativeApiModels
          .map((initiativeApiModel) => InitiativeModel(
                id: initiativeApiModel.id.toString(),
                author: JonogonModel(
                  id: initiativeApiModel.jonogon!.id.toString(),
                  username: initiativeApiModel.jonogon!.username,
                  fullName: initiativeApiModel.jonogon!.fullName,
                  mobileNumber: initiativeApiModel.jonogon!.mobileNumber,
                  imageURL: initiativeApiModel.jonogon!.imageURL,
                ),
                imageURL: initiativeApiModel.imageURL,
                createdAt: initiativeApiModel.createdAt,
                description: initiativeApiModel.description,
                solution: initiativeApiModel.solution,
              ))
          .toList();
      emit(
        CommunityLoadedState(initiativeModels: [
          ...initiativeModel.reversed,
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
