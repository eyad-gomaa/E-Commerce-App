part of 'sign_in_cubit.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}
class SignInLoading extends SignInState {}
class SignInSuccess extends SignInState {
  LoginModel userLoginModel;
  SignInSuccess({required this.userLoginModel});
}
class SignInFailure extends SignInState {
  final String errMessage;
  SignInFailure({required this.errMessage});

}
