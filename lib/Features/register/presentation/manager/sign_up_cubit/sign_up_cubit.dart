import 'package:e_commerce1/Features/register/data/models/register_model.dart';
import 'package:e_commerce1/Features/register/data/repos/sign_up_repo/sign_up_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.repo}) : super(SignUpInitial());
  final SignUpRepo repo;
  String? emailAddress;
  String? password;
  String? name;
  String? phone;

  Future <void> signUp() async{
        emit(SignUpLoading());
        var result = await repo.signUp(name!,emailAddress!, password!,phone!);
        result.fold(
                (l) =>emit(SignUpFailure(errMessage: l.errMessage)),
                (r) {
                  emit(SignUpSuccess(userRegisterModel: r));

                }

        );

  }
}