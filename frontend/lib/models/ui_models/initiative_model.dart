import 'package:equatable/equatable.dart';
import 'package:frontend/api_repository/initiative_api.dart';
import 'package:frontend/models/api_models/initiative_api_model.dart';
import 'package:frontend/models/ui_models/jonogon_model.dart';

class InitiativeModel extends Equatable {
  const InitiativeModel({
    required this.imageURL,
    required this.createdAt,
    required this.author,
    required this.id,
    required this.description,
    required this.solution,
    required this.steps,
    this.appreciateCount = 0,
    this.didUserAppreciate = false,
    this.isImIn = false,
    this.comments = const [],
    this.iAmInCount = 0,
    this.showComment = false,
  });

  factory InitiativeModel.fromApiModel({
    required InitiativeApiModel model,
    required int idJ,
  }) {
    return InitiativeModel(
      appreciateCount: model.appreciateCount,
      iAmInCount: model.iAmInCount,
      comments: [],
      showComment: true,
      didUserAppreciate: await InitiativeApi.isInitiateAppreciateByJonogon(
        idJ: idJ,
        idI: model.id,
      ),
      imageURL:
          'https://i0.wp.com/picjumbo.com/wp-content/uploads/pile-of-garbage-in-the-middle-of-the-city-free-photo.jpg?w=2210&quality=70',
      createdAt: model.createdAt,
      author: model.jonogon,
      id: model.id.toString(),
      description: model.description,
      solution: model.solution,
      steps: const [], //TODO: Add steps to the model
    );
  }
  final String id;
  final String description;
  final String solution;
  final List<String> steps; // List of steps for the solution
  final int appreciateCount;
  final bool didUserAppreciate;
  final bool isImIn;
  final List<String> comments;
  final JonogonModel author;
  final DateTime createdAt;
  final String imageURL;
  final int iAmInCount;
  final bool showComment;

  @override
  List<Object?> get props => [
        id,
        showComment,
        description,
        solution,
        steps,
        appreciateCount,
        didUserAppreciate,
        isImIn,
        comments,
        author,
        createdAt,
        imageURL,
      ];

  InitiativeModel copyWith({
    String? id,
    bool? showComment,
    JonogonModel? author,
    String? description,
    String? imageURL,
    String? solution,
    List<String>? steps,
    int? appreciateCount,
    bool? didUserAppreciate,
    bool? isImIn,
    List<String>? comments,
    DateTime? createdAt,
    int? iAmInCount,
  }) {
    return InitiativeModel(
      id: id ?? this.id,
      showComment: showComment ?? this.showComment,
      author: author ?? this.author,
      createdAt: createdAt ?? this.createdAt,
      imageURL: imageURL ?? this.imageURL,
      description: description ?? this.description,
      solution: solution ?? this.solution,
      steps: steps ?? this.steps,
      appreciateCount: appreciateCount ?? this.appreciateCount,
      didUserAppreciate: didUserAppreciate ?? this.didUserAppreciate,
      isImIn: isImIn ?? this.isImIn,
      comments: comments ?? this.comments,
      iAmInCount: iAmInCount ?? this.iAmInCount,
    );
  }
}
