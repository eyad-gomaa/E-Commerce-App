import 'package:e_commerce1/Features/register/data/repos/sign_in_repo/sign_in_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/login_model.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.repo}) : super(SignInInitial());
  final SignInRepo repo;
  late String emailAddress;
  late String password;

  Future <void> signIn() async {
    emit(SignInLoading());
    var result = await repo.signIn(
        emailAddress: emailAddress, password: password);
    result.fold(
            (l) => emit(SignInFailure(errMessage: l.errMessage)),
            (r) {
              emit(SignInSuccess(userLoginModel: r,));
            }
    );
  }
}
