import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce1/Features/home/data/model/profile_model/profile_model.dart';
import 'package:e_commerce1/core/utils/api_service.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/failure/failure.dart';
import '../../../favourite/data/model/favourite_model.dart';
import '../model/category_model/category_model.dart';
import '../model/product_model/product_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure,ProductModel>>getProducts() async {
    ProductModel? productModel;
    try {
      await DioHelper.getData(endpoint: "products").then((value){
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

  @override
  Future<Either<Failure, CategoryModel>> getBrand() async {
    CategoryModel? categoryModel;
    try {
      await DioHelper.getData(endpoint: "categories").then((value) {
        categoryModel = CategoryModel.fromJson(value.data);
      });
      return right(categoryModel!);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<List<ProductModel>> getBrandProducts(String brand) async {
    List<ProductModel> productList = [];
    try {
      productList.clear();
       await FirebaseFirestore.instance
          .collection("products")
          .where("brand", isEqualTo: brand)
          .get();
      // for (var element in response.docs) {
      //   // productList.add(ProductModel.fromJson());
      // }
      return productList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("There is an Error ${e.code} : ${e.message}");
      }
      return productList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getCartProducts() async {
    List<ProductModel> productList = [];
    try {
      productList.clear();
      await FirebaseFirestore.instance
          .collection("products")
          .where("id", whereIn: ["0rCW59b888hIwjQPq80w"]).get();
      // for (var element in response.docs) {
      //   // productList.add(ProductModel.fromJson(element));
      // }
      return productList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("There is an Error ${e.code} : ${e.message}");
      }
      return productList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async{
    ProfileModel? profileModel;
    try {
      await DioHelper.getData(endpoint: "profile").then((value) {
        profileModel = ProfileModel.fromJson(value.data);
      });
      return right(profileModel!);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, FavouriteModel>> getFavouriteProducts() async {
    FavouriteModel? favouriteModel;
    try {
      await DioHelper.getData(endpoint: "favorites").then((value) {
        favouriteModel = FavouriteModel.fromJson(value.data);
      });
      return right(favouriteModel!);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
