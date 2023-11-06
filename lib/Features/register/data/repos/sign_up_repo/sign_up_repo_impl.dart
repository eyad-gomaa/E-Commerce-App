import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce1/Features/register/data/repos/sign_up_repo/sign_up_repo.dart';
import 'package:e_commerce1/core/utils/api_service.dart';
import '../../../../../core/failure/failure.dart';
import '../../models/register_model.dart';

class SignUpRepoImpl implements SignUpRepo{
  RegisterModel? userRegisterModel;
  @override
  Future<Either<Failure,RegisterModel>>signUp(String name,String emailAddress,String password,String phone,)async {
    try {
      await DioHelper.postData(
          data: {
        "name" : name,
        "email" : emailAddress,
        "password" : password,
        "phone" : phone,
      },
          endpoint: "register"
      ).then((value) => {
        userRegisterModel = RegisterModel.fromJson(value.data)
      });
      return right(userRegisterModel!);
    } on Exception catch (e) {
      if (e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
      }
  }

