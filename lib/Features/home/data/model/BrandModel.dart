class BrandModel {
  BrandModel({
      this.name,
      this.image,
    this.id
  });

  BrandModel.fromJson(dynamic json) {
    name = json['name'] ?? " ";
    image = json['image'] ?? " ";
    id = json['id'] ?? 0;
  }
  String? name;
  String? image;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['id'] = id;
    return map;
  }

}