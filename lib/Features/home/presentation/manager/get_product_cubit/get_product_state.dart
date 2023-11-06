part of 'get_product_cubit.dart';

abstract class GetProductState {}

class GetProductInitial extends GetProductState {}
class GetProductLoading extends GetProductState {}
class GetProductSuccess extends GetProductState {
  final List<ProductDataModel> productList ;
  GetProductSuccess({required this.productList});
}
class GetProductFailure extends GetProductState {
  final String errMessage;
  GetProductFailure({required this.errMessage});
}

class EditFavouriteProductsSuccess extends GetProductState {}
//******************************************************************
class GetFavouriteProductsInitial extends GetProductState {}
class GetFavouriteProductsLoading extends GetProductState {}
class GetFavouriteProductsSuccess extends GetProductState {
  final List<FavouriteDataModel> productList ;
  GetFavouriteProductsSuccess({required this.productList});
}
class GetFavouriteProductsFailure extends GetProductState {
  final String errMessage;
  GetFavouriteProductsFailure({required this.errMessage});
}