

import 'package:frontend/api_repository/initiative_api.dart';

void main(List<String> args) {
  final initiatives = InitiativeApi.getAllInitiatives();
  print(initiatives);
}