import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce1/Features/register/data/repos/sign_in_repo/sign_in_repo.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../core/utils/api_service.dart';
import '../../models/login_model.dart';

class SignInRepoImpl implements SignInRepo{
  LoginModel? userLoginModel;
  @override
  Future<Either<Failure,LoginModel>>signIn({required emailAddress, required password}) async{
    try {
      await DioHelper.postData(data: {
        "email": emailAddress,
        "password" : password,
      }, endpoint: 'login').then((value){
        userLoginModel = LoginModel.fromJson(value.data);
      });
      return right(userLoginModel!);
    }on Exception catch (e) {
      if (e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}