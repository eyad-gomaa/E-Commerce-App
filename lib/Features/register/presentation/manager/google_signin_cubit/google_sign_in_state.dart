part of 'google_sign_in_cubit.dart';

abstract class GoogleSignInState {}

class GoogleSignInInitial extends GoogleSignInState {}
class GoogleSignInLoading extends GoogleSignInState {}
class GoogleSignInSuccess extends GoogleSignInState {}
class GoogleSignInFailed extends GoogleSignInState {
  final String errMessage;
  GoogleSignInFailed({required this.errMessage});
}
