import 'dart:convert';

import 'package:frontend/models/api_models/initiative_api_model.dart';
import 'package:http/http.dart' as http;

class InitiativeApi {
  static const String baseUrl = 'http://localhost:8080';

  static Future<List<InitiativeApiModel>> getAllInitiatives() async {
    final response = await http.get(Uri.parse('$baseUrl/initiative/all'));
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

  // static Future<int> getCountOfInitiativesById(int id) async {
  //   final response = await http
  //       .get(Uri.parse('$baseUrl/initiative/$id' '/appreciate/count'));
  //   if (response.statusCode == 200) {
  //     return int.parse(response.body);
  //   } else {
  //     throw Exception('Failed to load count of initiative $id');
  //   }
  // }

  static Future<int> getCountOfAppreciateById(int id) async {
    final response = await http
        .get(Uri.parse('$baseUrl/initiative/$id' '/appreciate/count'));
    if (response.statusCode == 200) {
      return int.parse(response.body);
    } else {
      throw Exception('Failed to load count of appreciate of initiative $id');
    }
  }

  static Future<int> getCountOfCommentById(int id) async {
    final response =
        await http.get(Uri.parse('$baseUrl/initiative/$id' '/comment/count'));
    if (response.statusCode == 200) {
      return int.parse(response.body);
    } else {
      throw Exception('Failed to load count of comments of initiative $id');
    }
  }

  static Future<int> getCountOfIAmInById(int id) async {
    final response =
        await http.get(Uri.parse('$baseUrl/initiative/$id' '/iAmIn/count'));
    if (response.statusCode == 200) {
      return int.parse(response.body);
    } else {
      throw Exception('Failed to load count of iAmIn of initiative $id');
    }
  }

  static Future<bool> isInitiateAppreciateByJonogon(int idI, int idJ) async {
    final response = await http
        .get(Uri.parse('$baseUrl/initiative/$idI' '/appreciate/$idJ'));
    if (response.statusCode == 200) {
      return json.decode(response.body).toString().toLowerCase() == 'true';
    } else {
      throw Exception(
        'Failed to check if Initiative $idI is appreciated by Jonogon $idJ',
      );
    }
  }

  static Future<bool> isInitiateIAmInByJonogon(int idI, int idJ) async {
    final response =
        await http.get(Uri.parse('$baseUrl/initiative/$idI' '/iAmIn/$idJ'));
    if (response.statusCode == 200) {
      return json.decode(response.body).toString().toLowerCase() == 'true';
    } else {
      throw Exception(
        'Failed to check if Initiative $idI is appreciated by Jonogon $idJ',
      );
    }
  }

  static Future<List<String>> getAllCommentsOfInitiativeById(int idI) async {
    final response =
        await http.get(Uri.parse('$baseUrl/initiative/$idI/comment/all'));
    if (response.statusCode == 200) {
      final data = (json.decode(response.body) as List).cast<String>();
      return data;
    } else {
      throw Exception('Failed to load comments for initiative $idI');
    }
  }

  static Future<void> postAnInitiativeAppreciation(int idI, int idJ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/initiative/$idI' '/appreciate/$idJ'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to post an initiative appreciation');
    }
  }

  static Future<void> postAnInitiativeIAmIn(int idI, int idJ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/initiative/$idI' '/iAmIn/$idJ'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to post an initiative appreciation');
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

  // static Future<void> postJonogonAppreciatesInitiative(
  //   int idI,
  //   int idJ,
  // ) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/initiative/$idI' '/appreciate/$idJ'),
  //   );
  //   if (response.statusCode != 201) {
  //     throw Exception('Failed to post jonogon appreciates initiative');
  //   }
  // }
}
