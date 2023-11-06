import 'package:dartz/dartz.dart';
import 'package:e_commerce1/Features/cart/data/model/cart_model.dart';
import 'package:e_commerce1/core/failure/failure.dart';

import '../../../favourite/data/model/edit_favourite_products.dart';

abstract class CartRepo{
  Future<Either<Failure,CartModel>>getCartData();
  Future<Either<Failure,EditFavouriteModel>>addCartData({required productId});
}