import 'package:e_commerce1/Features/cart/data/repo/cart_repo.dart';
import 'package:e_commerce1/Features/home/data/repos/details_repo.dart';
import 'package:e_commerce1/Features/home/data/repos/home_repo.dart';
import 'package:e_commerce1/Features/home/data/repos/home_repo_impl.dart';
import 'package:e_commerce1/Features/register/data/repos/sign_in_repo/sign_in_repo.dart';
import 'package:get_it/get_it.dart';
import '../../Features/cart/data/repo/cart_repo_impl.dart';
import '../../Features/home/data/repos/details_repo_impl.dart';
import '../../Features/favourite/data/repos/favourite_repo.dart';
import '../../Features/favourite/data/repos/favourite_repo_impl.dart';
import '../../Features/payment/data/repo/payment_repo.dart';
import '../../Features/payment/data/repo/payment_repo_impl.dart';
import '../../Features/register/data/repos/google_signin_repo/google_signin_repo_impl.dart';
import '../../Features/register/data/repos/sign_in_repo/sign_in_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator(){
  getIt.registerSingleton<GoogleRepoImpl>(GoogleRepoImpl());
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl());
  getIt.registerSingleton<SignInRepo>(SignInRepoImpl());
  getIt.registerSingleton<DetailsRepo>(DetailsRepoImpl());
  getIt.registerSingleton<FavouriteRepo>(FavouriteRepoImpl());
  getIt.registerSingleton<CartRepo>(CartRepoImpl());
  getIt.registerSingleton<PaymentRepo>(PaymentRepoImpl());


}