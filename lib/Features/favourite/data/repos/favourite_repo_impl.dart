import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/utils/api_service.dart';
import '../../../home/data/model/product_model/product_model.dart';
import '../model/favourite_model.dart';
import 'favourite_repo.dart';

class FavouriteRepoImpl implements FavouriteRepo {
  @override
  Future<Either<Failure, FavouriteModel>> getFavouriteProducts() async {
    FavouriteModel? favouriteModel;
    try {
      await DioHelper.getData(endpoint: "favorites").then((value) {
        favouriteModel = FavouriteModel.fromJson(value.data);
      });
      return right(favouriteModel!);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure,ProductModel>>getProducts() async {
    ProductModel? productModel;
    try {
      await DioHelper.getData(endpoint: "products").then((value){
        productModel = ProductModel.fromJson(value.data);
      });
      return right(productModel!);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }

  }
}
