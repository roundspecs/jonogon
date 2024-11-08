import 'dart:convert';

import 'package:frontend/models/api_models/initiative_api_model.dart';
import 'package:http/http.dart' as http;

class InitiativeApi {
  static const String baseUrl = 'http://localhost:8080';

  static Future<List<InitiativeApiModel>> getAllInitiatives() async {
    final response = await http.get(Uri.parse('$baseUrl/initiative/all'));
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      final data =
          (json.decode(response.body) as List).cast<Map<String, dynamic>>();
      return data.map<InitiativeApiModel>(InitiativeApiModel.fromJson).toList();
    } else {
      throw Exception('Failed to load initiatives');
    }
  }

  static Future<InitiativeApiModel> getInitiativesById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/initiative/$id'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return InitiativeApiModel.fromJson(data);
    } else {
      throw Exception('Failed to load initiative $id');
    }
  }

  static Future<void> postAnInitiative(
    InitiativeApiModel initiative,
    int jonogonId,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/initiative/jonogon/$jonogonId'),
      body: jsonEncode(initiative.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to assign a jonogon to an initiative');
    }
  }
}
