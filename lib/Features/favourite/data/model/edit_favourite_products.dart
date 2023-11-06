class EditFavouriteModel {
  EditFavouriteModel({
    required this.status,
    required this.message,

  });

  final bool? status;
  final String? message;

  factory EditFavouriteModel.fromJson(Map<String, dynamic> json){
    return EditFavouriteModel(
      status: json["status"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };

}