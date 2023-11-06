import 'data.dart';

class CategoryModel {
	bool? status;
	dynamic message;
	CategoryData? data;

	CategoryModel({this.status, this.message, this.data});

	factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
				status: json['status'] as bool?,
				message: json['message'] as dynamic,
				data: json['data'] == null
						? null
						: CategoryData.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'data': data?.toJson(),
			};
}
