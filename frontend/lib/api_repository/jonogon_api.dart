import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class JonogonApiModel extends Equatable {
  const JonogonApiModel({
    required this.id,
    required this.username,
    required this.fullname,
    required this.phoneNumber,
    required this.userSince,
    required this.profilePictureURL,
    required this.password,
  });

  factory JonogonApiModel.fromJson(Map<String, dynamic> json) {
    assert(json['password'] != null, 'Password is required');
    return JonogonApiModel(
      id: json['id'] as int,
      username: json['username'] as String,
      fullname: json['fullname'] as String,
      phoneNumber: json['phoneNumber'] as String,
      userSince: DateTime.parse(json['userSince'] as String),
      profilePictureURL: json['profilePictureURL'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'fullname': fullname,
      'phoneNumber': phoneNumber,
      'userSince': DateFormat('yyyy-MM-dd').format(userSince),
      'profilePictureURL': profilePictureURL,
      'password': password,
    };
  }

  final int id;
  final String username;
  final String fullname;
  final String phoneNumber;
  final DateTime userSince;
  final String profilePictureURL;
  final String? password;

  @override
  List<Object?> get props => [
        id,
        username,
        fullname,
        phoneNumber,
        userSince,
        profilePictureURL,
        password,
      ];
}
