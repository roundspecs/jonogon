import 'package:equatable/equatable.dart';
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
  });

  factory InitiativeModel.fromApiModel({
    required InitiativeApiModel model,
    required int idJ,
  }) {
    return InitiativeModel(
      imageURL:
          'https://i0.wp.com/picjumbo.com/wp-content/uploads/pile-of-garbage-in-the-middle-of-the-city-free-photo.jpg?w=2210&quality=70',
      createdAt: model.createdAt,
      author: model.jonogon,
      id: model.id.toString(),
      description: model.description,
      solution: model.solution,
    );
  }
  final String id;
  final String description;
  final String solution;
  final JonogonModel author;
  final DateTime createdAt;
  final String imageURL;

  @override
  List<Object?> get props => [
        id,
        description,
        solution,
        author,
        createdAt,
        imageURL,
      ];

  InitiativeModel copyWith({
    String? id,
    JonogonModel? author,
    String? description,
    String? imageURL,
    String? solution,
    DateTime? createdAt,
  }) {
    return InitiativeModel(
      id: id ?? this.id,
      author: author ?? this.author,
      createdAt: createdAt ?? this.createdAt,
      imageURL: imageURL ?? this.imageURL,
      description: description ?? this.description,
      solution: solution ?? this.solution,
    );
  }
}
