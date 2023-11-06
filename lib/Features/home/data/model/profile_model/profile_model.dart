class ProfileModel {
  ProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final dynamic message;
  final ProfileModelData? data;

  factory ProfileModel.fromJson(Map<String, dynamic> json){
    return ProfileModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : ProfileModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };

}

class ProfileModelData {
  ProfileModelData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final int? points;
  final int? credit;
  final String? token;

  factory ProfileModelData.fromJson(Map<String, dynamic> json){
    return ProfileModelData(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      image: json["image"],
      points: json["points"],
      credit: json["credit"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
    "points": points,
    "credit": credit,
    "token": token,
  };

}
