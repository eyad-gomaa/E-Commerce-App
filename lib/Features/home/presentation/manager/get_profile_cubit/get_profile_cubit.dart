import 'package:e_commerce1/Features/home/data/model/profile_model/profile_model.dart';
import 'package:e_commerce1/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit(this.repo) : super(GetProfileInitial());
  final HomeRepo repo;
  Future<void> getProfile()async{
    emit(GetProfileLoading());

    var result = await repo.getProfile();
    result.fold(
            (l){
          emit(GetProfileFailure(errMessage: l.errMessage));
        },
            (r){
          emit(GetProfileSuccess(profileModel: r));
        }
    );


  }
}
