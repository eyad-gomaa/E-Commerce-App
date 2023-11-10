import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce1/core/utils/api_service.dart';
import '../../../../core/failure/failure.dart';
import '../model/product_model/product_model.dart';
import 'details_repo.dart';

class DetailsRepoImpl implements DetailsRepo {
  @override
  Future<Either<Failure,ProductModel>>getCategoryProducts({required int categoryId}) async {
    ProductModel? productModel;
    try {
      await DioHelper.getData(endpoint: "products?category_id=$categoryId").then((value){
        productModel = ProductModel.fromJson(value.data);
      });
      return right(productModel!);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }

  }

}
