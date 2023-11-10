import 'package:e_commerce1/Features/home/data/repos/home_repo.dart';
import 'package:e_commerce1/core/utils/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/shared.dart';
import '../../../../favourite/data/model/favourite_model.dart';
import '../../../data/model/product_model/product_data_model.dart';
part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState>{
  GetProductCubit(this.repo,) : super(GetProductInitial());
  final HomeRepo repo;
  List<ProductDataModel>? productList ;
  List<FavouriteDataModel>? favProductList ;


  Future<void> getProducts()async{

      emit(GetProductLoading());

      var result = await repo.getProducts();
      result.fold(
              (l){
                emit(GetProductFailure(errMessage: l.errMessage));
                },
              (r){
                for (var element in r.data!.data) {
                  inCartMap.addAll({element.id!:element.inCart!});
                  inFavouritesMap.addAll({
                    element.id!:element.inFavorites!
                  });
                }
                productList = r.data!.data;
                emit(GetProductSuccess(productList: r.data!.data));
              }
      );
  }

  //***************************************************************
  Future<void> getFavouriteProducts()async{
    emit(GetFavouriteProductsLoading());
    var result = await repo.getFavouriteProducts();
    result.fold(
            (l){
          emit(GetFavouriteProductsFailure(errMessage: l.errMessage));
        },
            (r){
              favProductList = r.data!.data;
          emit(GetFavouriteProductsSuccess(productList: r.data!.data));
        }

    );
  }
  //***************************************************************
  Future<void> editFavouriteProductsFromHome(int productId) async{
    emit(EditFavouriteProductsSuccess());
    inFavouritesMap[productId] = !inFavouritesMap[productId]!;

    await DioHelper.postData(data: {"product_id" : productId}, endpoint: "favorites").then(
            (value) {
              // favProductList!.removeWhere((element) => element.product!.id == productId
              //
              // );
              getFavouriteProducts();
              // getFavouriteProducts();
              // emit(EditFavouriteProductsSuccess());

        }
    ).catchError((error){});
  }
  Future<void> editFavouriteProductsFromHomeFavourites(int productId) async{
    inFavouritesMap[productId] = !inFavouritesMap[productId]!;

    // emit(EditFavouriteProductsSuccess());
    await DioHelper.postData(data: {"product_id" : productId}, endpoint: "favorites").then(
            (value) async{

          // favProductList!.removeWhere((element) => element.product!.id == productId
          //
          // );
          //     await getFavouriteProducts();
          emit(EditFavouriteProductsSuccess());
          getFavouriteProducts();

        }
    ).catchError((error){});
  }
}
