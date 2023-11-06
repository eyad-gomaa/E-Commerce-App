import 'package:dartz/dartz.dart';
import 'package:e_commerce1/Features/register/data/models/register_model.dart';
import '../../../../../core/failure/failure.dart';

abstract class SignUpRepo{
  Future<Either<Failure,RegisterModel>>signUp(String name,String emailAddress,String password,String phone,);
}