import 'dart:convert';

AccesTokenModel AccesTokenModelFromJson(String str) => AccesTokenModel.fromJson(json.decode(str));

String AccesTokenModelToJson(AccesTokenModel data) => json.encode(data.toJson());

class AccesTokenModel {
  final String authToken;

  AccesTokenModel({
    required this.authToken,
  });

  factory AccesTokenModel.fromJson(Map<String, dynamic> json) => AccesTokenModel(
    authToken: json["auth_token"],
  );

  Map<String, dynamic> toJson() => {
    "auth_token": authToken
  };
}
