class ProductDataModel {
  ProductDataModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  final int? id;
  final double? price;
  final double? oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;
  final List<String> images;
  final bool? inFavorites;
  final bool? inCart;

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json["id"],
      price: json["price"].toDouble(),
      oldPrice: json["old_price"].toDouble(),
      discount: json["discount"],
      image: json["image"],
      name: json["name"],
      description: json["description"],
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      inFavorites: json["in_favorites"],
      inCart: json["in_cart"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "old_price": oldPrice,
        "discount": discount,
        "image": image,
        "name": name,
        "description": description,
        "images": images.map((x) => x).toList(),
        "in_favorites": inFavorites,
        "in_cart": inCart,
      };
}
