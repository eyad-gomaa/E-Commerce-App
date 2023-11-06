part of 'get_favourite_product_cubit.dart';

abstract class GetFavouriteProductsState {}

class GetFavouriteProductsInitial extends GetFavouriteProductsState {}
class GetFavouriteProductsLoading extends GetFavouriteProductsState {}
class GetFavouriteProductsSuccess extends GetFavouriteProductsState {
  final List<FavouriteDataModel> productList ;
  GetFavouriteProductsSuccess({required this.productList});
}
class GetFavouriteProductsFailure extends GetFavouriteProductsState {
  final String errMessage;
  GetFavouriteProductsFailure({required this.errMessage});
}
