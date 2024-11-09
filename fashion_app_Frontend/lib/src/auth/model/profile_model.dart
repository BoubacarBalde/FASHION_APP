import 'dart:convert';

ProfielModel profielModelFromJson(String str) => ProfielModel.fromJson(json.decode(str));

String profielModelToJson(ProfielModel data) => json.encode(data.toJson());


class ProfielModel {
  final String email;
  final String id;
  final String username;

  ProfielModel({
    required this.email,
    required this.id,
    required this.username,
  });

  factory ProfielModel.fromJson(Map<String, dynamic> json) => ProfielModel(
    email: json["email"],
    id: json["id"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "id": id,
    "username": username,
  };
}
