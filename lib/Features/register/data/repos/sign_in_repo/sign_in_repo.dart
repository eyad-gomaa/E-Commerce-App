import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../../models/login_model.dart';

abstract class SignInRepo{
 Future<Either<Failure,LoginModel>> signIn({required emailAddress,required password});
}