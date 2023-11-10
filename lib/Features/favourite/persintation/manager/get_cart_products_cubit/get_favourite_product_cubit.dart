import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/favourite_model.dart';
import '../../../data/repos/favourite_repo.dart';
part 'get_favourite_product_state.dart';

class GetFavouriteProductsCubit extends Cubit<GetFavouriteProductsState> {
  GetFavouriteProductsCubit(this.repo) : super(GetFavouriteProductsInitial());
  final FavouriteRepo repo;


  // Future<void> getFavouriteProducts()async{
  //   emit(GetFavouriteProductsLoading());
  //
  //   var result = await repo.getFavouriteProducts();
  //   result.fold(
  //           (l){
  //         emit(GetFavouriteProductsFailure(errMessage: l.errMessage));
  //       },
  //           (r){
  //         print( r.data!.data);
  //         emit(GetFavouriteProductsSuccess(productList: r.data!.data));
  //       }
  //   );
  // }
  // editFavouriteProducts(int productId)async{
  //   await DioHelper.postData(data: {"product_id" : productId}, endpoint: "favorites").then((value) {print(EditFavouriteModel.fromJson(value.data).message);});
  // }
}
