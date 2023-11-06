class FavouriteModel {
  FavouriteModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final dynamic message;
  final FavouriteData? data;

  factory FavouriteModel.fromJson(Map<String, dynamic> json){
    return FavouriteModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : FavouriteData.fromJson(json["data"]),
    );
  }


}

class FavouriteData {
  FavouriteData({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  final int? currentPage;
  final List<FavouriteDataModel> data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  factory FavouriteData.fromJson(Map<String, dynamic> json){
    return FavouriteData(
      currentPage: json["current_page"],
      data: json["data"] == null ? [] : List<FavouriteDataModel>.from(json["data"]!.map((x) => FavouriteDataModel.fromJson(x))),
      firstPageUrl: json["first_page_url"],
      from: json["from"],
      lastPage: json["last_page"],
      lastPageUrl: json["last_page_url"],
      nextPageUrl: json["next_page_url"],
      path: json["path"],
      perPage: json["per_page"],
      prevPageUrl: json["prev_page_url"],
      to: json["to"],
      total: json["total"],
    );
  }



}

class FavouriteDataModel {
  FavouriteDataModel({
    required this.id,
    required this.product,
  });

  final int? id;
  final Product? product;

  factory FavouriteDataModel.fromJson(Map<String, dynamic> json){
    return FavouriteDataModel(
      id: json["id"],
      product: json["product"] == null ? null : Product.fromJson(json["product"]),
    );
  }

}

class Product {
  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  final int? id;
  final double? price;
  final double? oldPrice;
  final double? discount;
  final String? image;
  final String? name;
  final String? description;

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json["id"],
      price: json["price"].toDouble(),
      oldPrice: json["old_price"].toDouble(),
      discount: json["discount"].toDouble(),
      image: json["image"],
      name: json["name"],
      description: json["description"],
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
  };

}
