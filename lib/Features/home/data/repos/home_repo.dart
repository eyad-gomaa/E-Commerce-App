import 'package:dartz/dartz.dart';
import 'package:e_commerce1/Features/home/data/model/category_model/category_model.dart';
import 'package:e_commerce1/core/failure/failure.dart';

import '../../../favourite/data/model/favourite_model.dart';
import '../model/product_model/product_model.dart';
import '../model/profile_model/profile_model.dart';


abstract class HomeRepo{
  Future<Either<Failure,ProfileModel>>getProfile();
  Future<Either<Failure,ProductModel>>getProducts();
  Future<Either<Failure,CategoryModel>>getBrand();
  Future<List<ProductModel>>getBrandProducts(String brand);
  Future<List<ProductModel>>getCartProducts();
  Future<Either<Failure,FavouriteModel>>getFavouriteProducts();
}