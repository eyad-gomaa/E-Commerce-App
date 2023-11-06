
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/google_signin_repo/google_signin_repo.dart';
part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit({required this.googleRepo}) : super(GoogleSignInInitial());
final GoogleRepo googleRepo;
  Future signInWithGoogle() async {
    googleRepo.signInWithGoogle();
  }
}