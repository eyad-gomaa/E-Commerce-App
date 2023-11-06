import '../../../data/model/category_model/datum.dart';

abstract class GetBrandState {}

class GetBrandInitial extends GetBrandState {}
class GetBrandLoading extends GetBrandState {}
class GetBrandSuccess extends GetBrandState {
  final List<CategoryDataModel> brandList ;
  GetBrandSuccess({required this.brandList});
}
class GetBrandFailure extends GetBrandState {
  final String errMessage;
  GetBrandFailure({required this.errMessage});
}