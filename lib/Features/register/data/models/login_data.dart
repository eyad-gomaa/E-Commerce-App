/// id : 59264
/// name : "eyad gomaa"
/// email : "eyad111@gmail.com"
/// phone : "7876786889"
/// image : "https://student.valuxapps.com/storage/assets/defaults/user.jpg"
/// points : 0
/// credit : 0
/// token : "KOdx9oxcPatqhTbPHy01v6Bv5Lz7cEHfpqg0jyY6UonTK9HZeAnna7jblqNBPZEGNTXT2I"

class LoginData {
  LoginData({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.image, 
      this.points, 
      this.credit, 
      this.token,});

  LoginData.fromJson(dynamic json) {
    id = json['id'] ;
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['image'] = image;
    map['points'] = points;
    map['credit'] = credit;
    map['token'] = token;
    return map;
  }

}