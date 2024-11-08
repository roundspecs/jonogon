import 'package:equatable/equatable.dart';
import 'package:frontend/models/api_models/jonogon_api_model.dart';
import 'package:frontend/models/ui_models/jonogon_model.dart';
import 'package:intl/intl.dart';

class InitiativeApiModel extends Equatable {
  const InitiativeApiModel({
    required this.id,
    required this.jonogonId,
    required this.imageURL,
    required this.steps,
    required this.appreciateCount,
    required this.iAmInCount,
    required this.description,
    required this.solution,
    required this.createdAt,
    required this.jonogon,
    required this.commentsCount,
    required this.locationDistrict,
    required this.locationUpazilla,
    required this.locationAddress,
  });

  factory InitiativeApiModel.fromJson(Map<String, dynamic> json) {
    return InitiativeApiModel(
      id: json['id'] as int,
      jonogonId: json['jonogonId'] as int,
      imageURL: json['imageURL'] as String,
      steps: List<String>.from(json['steps'] as List),
      appreciateCount: json['appreciateCount'] as int,
      iAmInCount: json['iAmInCount'] as int,
      description: json['description'] as String,
      solution: json['solution'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      jonogon: JonogonModel.fromApiModel(
        JonogonApiModel.fromJson(json['jonogon'] as Map<String, dynamic>),
      ),
      commentsCount: json['commentsCount'] as int,
      locationDistrict: json['locationDistrict'] as String,
      locationUpazilla: json['locationUpazilla'] as String,
      locationAddress: json['locationAddress'] as String,
    );
  }

  // Map<String, String> toJson() {
  //   return {
  //     'description': description,
  //     'solution': solution,
  //     'createdAt': DateFormat('yyyy-MM-dd').format(createdAt),
  //   };
  // }

  final int id;
  final int jonogonId;
  final String imageURL;
  final List<String> steps;
  final int appreciateCount;
  final int iAmInCount;
  final String description;
  final String solution;
  final DateTime createdAt;
  final JonogonModel jonogon;
  final int commentsCount;
  final String locationDistrict;
  final String locationUpazilla;
  final String locationAddress;

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        jonogonId,
        imageURL,
        steps,
        appreciateCount,
        iAmInCount,
        description,
        solution,
        createdAt,
        jonogon,
        commentsCount,
        locationDistrict,
        locationUpazilla,
        locationAddress,
      ];
}
