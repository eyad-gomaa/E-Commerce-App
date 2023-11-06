/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

import 'login_data.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.data,
        required this.message,
        required this.status,
    });

    LoginData data;
    String message;
    bool status;

    factory LoginModel.fromJson(Map<dynamic, dynamic> json) => LoginModel(
        data: LoginData.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "data": data.toJson(),
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
        required this.credit,
        required this.email,
        required this.points,
        required this.token,
    });

    String image;
    String phone;
    String name;
    int id;
    int credit;
    String email;
    int points;
    String token;

    factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        image: json["image"],
        phone: json["phone"],
        name: json["name"],
        id: json["id"],
        credit: json["credit"],
        email: json["email"],
        points: json["points"],
        token: json["token"],
    );

    Map<dynamic, dynamic> toJson() => {
        "image": image,
        "phone": phone,
        "name": name,
        "id": id,
        "credit": credit,
        "email": email,
        "points": points,
        "token": token,
    };
}
