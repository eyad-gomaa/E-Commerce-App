
	import 'package:e_commerce1/Features/home/data/model/product_model/product_data.dart';

class ProductModel {
	ProductModel({
	required this.status,
	required this.message,
	required this.data,
	});

	final bool? status;
	final dynamic message;
	final ProductData? data;

	factory ProductModel.fromJson(Map<String, dynamic> json){
	return ProductModel(
	status: json["status"],
	message: json["message"],
	data: json["data"] == null ? null : ProductData.fromJson(json["data"]),
	);
	}

	Map<String, dynamic> toJson() => {
	"status": status,
	"message": message,
	"data": data?.toJson(),
	};

	}
