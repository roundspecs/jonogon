import 'dart:convert';

import 'package:frontend/models/api_models/initiative_api_model.dart';
import 'package:frontend/models/api_models/jonogon_api_model.dart';
import 'package:http/http.dart' as http;

class JonogonApi {
  static const String baseUrl = 'http://localhost:8080';

  static Future<List<JonogonApiModel>> findAllJonogon() async {
    final response = await http.get(Uri.parse('$baseUrl/jonogon/all'));
    if (response.statusCode == 200) {
      final data =
          (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
      return data.map(JonogonApiModel.fromJson).toList();
    } else {
      throw Exception('Failed to load jonogons');
    }
  }

  static Future<JonogonApiModel> findJonogonById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/jonogon/$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return JonogonApiModel.fromJson(data);
    } else {
      throw Exception('Failed to load jonogon $id');
    }
  }

  static Future<List<InitiativeApiModel>> getAllInitiativesOfJonogonById(
      int id) async {
    final response =
        await http.get(Uri.parse('$baseUrl/jonogon/$id' '/initiative/all'));
    if (response.statusCode == 200) {
      final data =
          (json.decode(response.body) as List).cast<Map<String, dynamic>>();
      return data.map<InitiativeApiModel>(InitiativeApiModel.fromJson).toList();
    } else {
      throw Exception('Failed to load initiatives of jonogon $id');
    }
  }

  static Future<List<InitiativeApiModel>> getAllInitiativesIAmInOfJonogonById(
      int id) async {
    final response =
        await http.get(Uri.parse('$baseUrl/jonogon/$id' '/initiativesIAmIn'));
    if (response.statusCode == 200) {
      final data =
          (json.decode(response.body) as List).cast<Map<String, dynamic>>();
      return data.map<InitiativeApiModel>(InitiativeApiModel.fromJson).toList();
    } else {
      throw Exception('Failed to load initiatives jonogon $id is in');
    }
  }

  static Future<List<InitiativeApiModel>>
      getAllInitiativesAppreciatedByJonogonById(int id) async {
    final response = await http
        .get(Uri.parse('$baseUrl/jonogon/$id' '/initiativesAppreciated'));
    if (response.statusCode == 200) {
      final data =
          (json.decode(response.body) as List).cast<Map<String, dynamic>>();
      return data.map<InitiativeApiModel>(InitiativeApiModel.fromJson).toList();
    } else {
      throw Exception('Failed to load initiatives jonogon $id is in');
    }
  }

  static Future<void> postAJonogon(JonogonApiModel jonogon) async {
    final response = await http.post(
      Uri.parse('$baseUrl/jonogon'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(jonogon.toJson()),
    );
    if (response.statusCode != 200) {
      //Might change it to 201 later
      throw Exception('Failed to post a jonogon');
    }
  }
}
