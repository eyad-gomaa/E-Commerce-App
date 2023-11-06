import 'package:dartz/dartz.dart';
import 'package:e_commerce1/core/failure/failure.dart';
import '../model/product_model/product_model.dart';


abstract class DetailsRepo{
  Future<Either<Failure,ProductModel>>getCategoryProducts({required int categoryId});

}