import '../../../home/data/model/product_model/product_data_model.dart';

class CartModel {
  CartModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final dynamic message;
  final CartData? data;

  factory CartModel.fromJson(Map<String, dynamic> json){
    return CartModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : CartData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };

}

class CartData {
  CartData({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  final List<CartItem> cartItems;
  final double? subTotal;
  final double? total;

  factory CartData.fromJson(Map<String, dynamic> json){
    return CartData(
      cartItems: json["cart_items"] == null ? [] : List<CartItem>.from(json["cart_items"]!.map((x) => CartItem.fromJson(x))),
      subTotal: json["sub_total"].toDouble(),
      total: json["total"].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    "cart_items": cartItems.map((x) => x?.toJson()).toList(),
    "sub_total": subTotal,
    "total": total,
  };

}

class CartItem {
  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  final int? id;
  final int? quantity;
  final ProductDataModel? product;

  factory CartItem.fromJson(Map<String, dynamic> json){
    return CartItem(
      id: json["id"],
      quantity: json["quantity"],
      product: json["product"] == null ? null : ProductDataModel.fromJson(json["product"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "product": product?.toJson(),
  };

}

class CartProduct {
  CartProduct({
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
  final int? price;
  final int? oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;
  final List<String> images;
  final bool? inFavorites;
  final bool? inCart;

  factory CartProduct.fromJson(Map<String, dynamic> json){
    return CartProduct(
      id: json["id"],
      price: json["price"],
      oldPrice: json["old_price"],
      discount: json["discount"],
      image: json["image"],
      name: json["name"],
      description: json["description"],
      images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
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