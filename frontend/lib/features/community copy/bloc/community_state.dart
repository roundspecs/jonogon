part of 'community_bloc.dart';

@immutable
class CommunityState extends Equatable {
  const CommunityState({required this.posts});
  // CommunityState.final()
  //   : this(
  //     posts: InitiativeApi.getAllInitiatives().map((initiative) {
  //       final author = JonogonApi.getJonogon(initiative.authorId);
  //       return initiative.copyWith(author: author);
  //     }).toList(),
  //   )

  CommunityState.initial()
      : this(
          posts: [
            InitiativeModel(
              id: 1.toString(),
              author: JonogonModel(
                id: 2.toString(),
                username: 'Adid',
                fullName: 'Adid Rahman',
                mobileNumber: '01222222222',
                profilePicUrl:
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
                profilePicUrl:
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
          ],
        );
  final List<InitiativeModel> posts;

  @override
  List<Object> get props => [posts];

  CommunityState copyWith({List<InitiativeModel>? posts}) {
    return CommunityState(
      posts: posts ?? this.posts,
    );
  }
}
