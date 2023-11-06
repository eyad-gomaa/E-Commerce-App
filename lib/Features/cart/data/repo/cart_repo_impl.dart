import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:e_commerce1/Features/cart/data/model/cart_model.dart';
import 'package:e_commerce1/Features/favourite/data/model/edit_favourite_products.dart';

import 'package:e_commerce1/core/failure/failure.dart';
import 'package:e_commerce1/core/utils/api_service.dart';

import 'cart_repo.dart';

class CartRepoImpl implements CartRepo{
  @override
  Future<Either<Failure,CartModel>> getCartData() async {
    CartModel? cartModel;
    try {
      await DioHelper.getData(endpoint: "carts").then((value){
        cartModel = CartModel.fromJson(value.data);
      });
      return right(cartModel!);
    } on Exception catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }else {
        return left(ServerFailure(e.toString()));
      }
    }


  }

  @override
  Future<Either<Failure, EditFavouriteModel>> addCartData({required productId}) async{
    EditFavouriteModel? addToCartModel;
    try {
      await  DioHelper.postData(data:{"product_id": productId} , endpoint: "carts").then((value){
        addToCartModel = EditFavouriteModel.fromJson(value.data);
      });
      return right(addToCartModel!);
    } on Exception catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }else {
        return left(ServerFailure(e.toString()));
      }
    }

  }

}