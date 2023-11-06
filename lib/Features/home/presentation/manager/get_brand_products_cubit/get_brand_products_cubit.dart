import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/details_repo.dart';
import 'get_brand_products_state.dart';



class GetBrandProductsCubit extends Cubit<GetBrandProductsState> {
  GetBrandProductsCubit(this.repo) : super(GetBrandProductsInitial());
  final DetailsRepo repo;
  Future<void>getBrandProducts({required int categoryId})async{

      emit(GetBrandProductsLoading());

      var result = await repo.getCategoryProducts(categoryId: categoryId);
      result.fold(
              (l){
            emit(GetBrandProductsFailure(errMessage: l.errMessage));
          },
              (r){
            print( r.data!.data);
            emit(GetBrandProductsSuccess(productList: r.data!.data));
          }
      );


  }
}
