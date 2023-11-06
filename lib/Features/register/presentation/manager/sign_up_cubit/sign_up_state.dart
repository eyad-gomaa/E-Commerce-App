part of 'sign_up_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUpLoading extends SignUpState {}
class SignUpSuccess extends SignUpState {
  final RegisterModel userRegisterModel;
  SignUpSuccess({required this.userRegisterModel});
}
class SignUpFailure extends SignUpState {
  final String errMessage;
  SignUpFailure({required this.errMessage});

}
