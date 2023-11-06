
import '../../../../home/data/model/product_model/product_data_model.dart';
abstract class GetBrandProductsState {}

class GetBrandProductsInitial extends GetBrandProductsState {}
class GetBrandProductsLoading extends GetBrandProductsState {}
class GetBrandProductsSuccess extends GetBrandProductsState {
  final List<ProductDataModel> productList ;
  GetBrandProductsSuccess({required this.productList});
}
class GetBrandProductsFailure extends GetBrandProductsState {
  final String errMessage;
  GetBrandProductsFailure({required this.errMessage});
}
