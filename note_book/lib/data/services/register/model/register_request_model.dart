// To parse this JSON data, do
//
//     final registerRequestModel = registerRequestModelFromJson(jsonString);

import 'dart:convert';

String registerRequestModelToJson(RegisterRequestModel data) =>
    json.encode(data.toJson());

class RegisterRequestModel {
  final String userName;
  final String email;
  final String book;
  final String password;

  RegisterRequestModel({
    required this.userName,
    required this.email,
    required this.book,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "email": email,
        "book": book,
        "password": password,
      };
}
