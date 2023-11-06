import 'datum.dart';

class CategoryData {
	int? currentPage;
	List<CategoryDataModel>? data;
	String? firstPageUrl;
	int? from;
	int? lastPage;
	String? lastPageUrl;
	dynamic nextPageUrl;
	String? path;
	int? perPage;
	dynamic prevPageUrl;
	int? to;
	int? total;

	CategoryData({
		this.currentPage, 
		this.data, 
		this.firstPageUrl, 
		this.from, 
		this.lastPage, 
		this.lastPageUrl, 
		this.nextPageUrl, 
		this.path, 
		this.perPage, 
		this.prevPageUrl, 
		this.to, 
		this.total, 
	});

	factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
				currentPage: json['current_page'] as int?,
				data: (json['data'] as List<dynamic>?)
						?.map((e) => CategoryDataModel.fromJson(e as Map<String, dynamic>))
						.toList(),
				firstPageUrl: json['first_page_url'] as String?,
				from: json['from'] as int?,
				lastPage: json['last_page'] as int?,
				lastPageUrl: json['last_page_url'] as String?,
				nextPageUrl: json['next_page_url'] as dynamic,
				path: json['path'] as String?,
				perPage: json['per_page'] as int?,
				prevPageUrl: json['prev_page_url'] as dynamic,
				to: json['to'] as int?,
				total: json['total'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'current_page': currentPage,
				'data': data?.map((e) => e.toJson()).toList(),
				'first_page_url': firstPageUrl,
				'from': from,
				'last_page': lastPage,
				'last_page_url': lastPageUrl,
				'next_page_url': nextPageUrl,
				'path': path,
				'per_page': perPage,
				'prev_page_url': prevPageUrl,
				'to': to,
				'total': total,
			};
}
