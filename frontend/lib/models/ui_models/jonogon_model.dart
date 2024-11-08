import 'package:frontend/models/api_models/jonogon_api_model.dart';
import 'package:frontend/models/ui_models/initiative_model.dart';

class JonogonModel {
  JonogonModel({
    required this.id,
    required this.username,
    required this.fullName,
    required this.mobileNumber,
    required this.profilePicUrl,
    this.posts = const [],
  });

  factory JonogonModel.fromApiModel(JonogonApiModel apiModel) {
    return JonogonModel(
      id: apiModel.id.toString(),
      username: apiModel.userName,
      fullName: apiModel.fullName,
      mobileNumber: apiModel.phoneNumber,
      profilePicUrl: apiModel.imageURL,
    );
  }

  final String id;
  final String username;
  final String fullName;
  final String mobileNumber;
  final String profilePicUrl;
  final List<InitiativeModel> posts;
}
