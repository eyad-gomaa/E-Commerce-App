import 'package:firebase_auth/firebase_auth.dart';
 class Failure{
  final String errMessage;
  Failure(this.errMessage);
}
class RegisterFailure extends Failure{
  RegisterFailure(super.errMessage);
  factory RegisterFailure.fromSignUpError(FirebaseAuthException registerException){
    switch(registerException.code){
      case 'weak-password':
        return RegisterFailure('The password provided is too weak.');
      case  'email-already-in-use':
        return RegisterFailure('The account already exists for that email.');
      case  'user-not-found':
        return RegisterFailure('No user found for that email.');
      case  'wrong-password':
        return RegisterFailure('Wrong password provided for that user.');
      default:
        return RegisterFailure("oops There was an error ");


    }

  }
}