class JonogonApiModel {
  const JonogonApiModel({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.phoneNumber,
    required this.password,
    required this.imageURL,
    required this.skills,
  });


  final int id;
  final String userName;
  final String fullName; 
  final String phoneNumber;
  final String password;
  final String imageURL;
  final List <String> skills;

  factory JonogonApiModel.fromJson(Map<String, dynamic> json) {
    return JonogonApiModel(
      id: json['id'] as int,
      userName: json['userName'] as String,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      imageURL: json['imageURL'] as String,
      skills: json['skills'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'password': password,
      'imageURL': imageURL,
      'skills': skills,
    };
  }

}