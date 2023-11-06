import 'package:e_commerce1/Features/home/presentation/manager/get_brand_cubit/get_brand_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';

class GetBrandCubit extends Cubit<GetBrandState> {
  GetBrandCubit(this.repo) : super(GetBrandInitial());
  final HomeRepo repo;
  Future<void> getBrand() async {
    emit(GetBrandLoading());
    var result = await repo.getBrand();
    result.fold((l) => emit(GetBrandFailure(errMessage: l.errMessage)), (r) {
      var data = r.data!.data!;
      emit(GetBrandSuccess(brandList: data));
    });
    // try {
    //   emit(GetBrandLoading());
    //  var response = await repo.getBrand();
    //   emit(GetBrandSuccess(brandList: response));
    // } on Exception catch (e) {
    //   emit(GetBrandFailure(errMessage: e.toString()));
    // }
  }
}
