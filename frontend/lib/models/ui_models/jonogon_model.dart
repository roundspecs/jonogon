import 'package:equatable/equatable.dart';
import 'package:frontend/models/api_models/jonogon_api_model.dart';
import 'package:frontend/models/ui_models/initiative_model.dart';

class JonogonModel extends Equatable {
  const JonogonModel({
    required this.id,
    required this.username,
    required this.fullName,
    required this.mobileNumber,
    required this.imageURL,
    this.initiatives = const [],
  });

  factory JonogonModel.fromApiModel(JonogonApiModel apiModel) {
    return JonogonModel(
      id: apiModel.id.toString(),
      username: apiModel.userName,
      fullName: apiModel.fullName,
      mobileNumber: apiModel.phoneNumber,
      imageURL: apiModel.imageURL,
    );
  }

  final String id;
  final String username;
  final String fullName;
  final String mobileNumber;
  final String imageURL;
  final List<InitiativeModel> initiatives;

  @override
  List<Object?> get props => [
        id,
        username,
        fullName,
        mobileNumber,
        imageURL,
        initiatives,
      ];
}
