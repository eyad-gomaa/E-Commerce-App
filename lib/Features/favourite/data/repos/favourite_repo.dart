import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../../home/data/model/product_model/product_model.dart';
import '../model/favourite_model.dart';

abstract class FavouriteRepo{
  Future<Either<Failure,FavouriteModel>>getFavouriteProducts();
  Future<Either<Failure,ProductModel>>getProducts();
}