/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.data,
    required this.message,
    required this.status,
  });

  Data? data;
  String message;
  bool status;

  factory RegisterModel.fromJson(Map<dynamic, dynamic> json) => RegisterModel(
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        message: json["message"],
        status: json["status"],
      );

  Map<dynamic, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  Data({
    required this.image,
    required this.phone,
    required this.name,
    required this.id,
    required this.email,
    required this.token,
  });

  String image;
  String phone;
  String name;
  int id;
  String email;
  String token;

  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        image: json["image"],
        phone: json["phone"],
        name: json["name"],
        id: json["id"],
        email: json["email"],
        token: json["token"],
      );

  Map<dynamic, dynamic> toJson() => {
        "image": image,
        "phone": phone,
        "name": name,
        "id": id,
        "email": email,
        "token": token,
      };
}
