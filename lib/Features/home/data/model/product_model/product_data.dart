import 'product_data_model.dart';

class ProductData {
	ProductData({
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
	final List<ProductDataModel> data;
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

	factory ProductData.fromJson(Map<String, dynamic> json){
		return ProductData(
			currentPage: json["current_page"],
			data: json["data"] == null ? [] : List<ProductDataModel>.from(json["data"]!.map((x) => ProductDataModel.fromJson(x))),
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

	Map<String, dynamic> toJson() => {
		"current_page": currentPage,
		"data": data.map((x) => x?.toJson()).toList(),
		"first_page_url": firstPageUrl,
		"from": from,
		"last_page": lastPage,
		"last_page_url": lastPageUrl,
		"next_page_url": nextPageUrl,
		"path": path,
		"per_page": perPage,
		"prev_page_url": prevPageUrl,
		"to": to,
		"total": total,
	};

}
