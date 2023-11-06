class CategoryDataModel {
	int? id;
	String? name;
	String? image;

	CategoryDataModel({this.id, this.name, this.image});

	factory CategoryDataModel.fromJson(Map<String, dynamic> json) => CategoryDataModel(
				id: json['id'] as int?,
				name: json['name'] as String?,
				image: json['image'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'image': image,
			};
}
