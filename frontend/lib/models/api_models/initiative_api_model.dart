import 'package:equatable/equatable.dart';
import 'package:frontend/models/api_models/jonogon_api_model.dart';
import 'package:frontend/models/ui_models/jonogon_model.dart';
import 'package:intl/intl.dart';

class InitiativeApiModel extends Equatable {
  const InitiativeApiModel({
    this.id,
    required this.imageURL,
    required this.description,
    required this.solution,
    required this.createdAt,
    this.jonogon,
  });

  factory InitiativeApiModel.fromJson(Map<String, dynamic> json) {
    return InitiativeApiModel(
      id: json['id'] as int,
      description: json['description'] as String,
      solution: json['solution'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      imageURL: json['initiativePictureUrl'] as String,
      jonogon: JonogonModel.fromApiModel(
        JonogonApiModel.fromJson(json['jonogon'] as Map<String, dynamic>),
      ),
    );
  }

  Map<String, String> toJson() {
    return {
      'description': description,
      'solution': solution,
      'createdAt': DateFormat('yyyy-MM-dd').format(createdAt),
      'initiativePictureUrl':
          "https://cdn.pixabay.com/photo/2017/09/08/18/20/garbage-2729608_640.jpg",
    };
  }

  final int? id;
  final String imageURL;
  final String description;
  final String solution;
  final DateTime createdAt;
  final JonogonModel? jonogon;

  @override
  List<Object?> get props => [
        id,
        imageURL,
        description,
        solution,
        createdAt,
        jonogon,
      ];
}
