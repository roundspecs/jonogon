class JonogonApiModel {
  const JonogonApiModel({
    required this.id,
    required this.username,
    required this.fullname,
    required this.phoneNumber,
    required this.password,
    required this.imageURL,
    required this.skills,
  });

  final int id;
  final String username;
  final String fullname;
  final String phoneNumber;
  final String password;
  final String imageURL;
  final List<String> skills;

  factory JonogonApiModel.fromJson(Map<String, dynamic> json) {
    return JonogonApiModel(
      id: json['id'] as int,
      username: json['username'] as String,
      fullname: json['fullname'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      imageURL: json['profilePictureURL'] as String,
      skills: json['skills'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': username,
      'fullName': fullname,
      'phoneNumber': phoneNumber,
      'password': password,
      'imageURL': imageURL,
      'skills': skills,
    };
  }
}
