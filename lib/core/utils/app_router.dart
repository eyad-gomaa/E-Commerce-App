import 'package:e_commerce1/Features/home/data/repos/home_repo.dart';
import 'package:e_commerce1/Features/home/presentation/manager/get_brand_cubit/get_brand_cubit.dart';
import 'package:e_commerce1/Features/payment/persentation/view/payment_view.dart';
import 'package:e_commerce1/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Features/cart/data/repo/cart_repo.dart';
import '../../Features/cart/presentation/manager/cart_cubit.dart';
import '../../Features/cart/presentation/view/cart_view.dart';
import '../../Features/cart/presentation/view/order_confirmed_view.dart';
import '../../Features/details/presentation/view/details_view.dart';
import '../../Features/favourite/persintation/view/favourite_view.dart';
import '../../Features/home/data/model/category_model/datum.dart';
import '../../Features/home/data/model/product_model/product_data_model.dart';
import '../../Features/home/presentation/manager/HomeCubit/home_cubit.dart';
import '../../Features/home/presentation/manager/get_profile_cubit/get_profile_cubit.dart';
import '../../Features/home/presentation/view/SelectScreen.dart';
import '../../Features/home/presentation/view/brand_view.dart';
import '../../Features/home/presentation/view/home_view.dart';
import '../../Features/payment/persentation/view/add_card_screen.dart';
import '../../Features/payment/persentation/view/widget/add_card_screen_body.dart';
import '../../Features/register/presentation/view/get_started_view.dart';
import '../../Features/register/presentation/view/sign_in_view.dart';
import '../../Features/register/presentation/view/sign_up_view.dart';
import '../../Features/splash/presentation/view/gender_view.dart';
import '../../Features/splash/presentation/view/splash_view.dart';

class RouterPath {
  static const String splashView = '/';
  static const String genderView = '/gender';
  static const String getStartedView = '/getStarted';
  static const String signUpView = '/signUpView';
  static const String signInView = '/signInView';
  static const String homeView = '/homeView';
  static const String detailsView = '/detailsView';
  static const String brandView = '/brandView';
  static const String favouriteView = '/favouriteView';
  static const String cartView = '/cartView';
  static const String selectScreen = '/selectScreen';
  static const String paymentView = '/paymentView';
  static const String orderConfirmedView = '/orderConfirmedView';
  static const String addCardScreen = '/addCardScreen';
}

final GoRouter router = GoRouter(
  routes: [
    //************* SplashScreen *************
    GoRoute(
        path: RouterPath.splashView,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen()),
    //************* GenderView *************
    GoRoute(
        path: RouterPath.genderView,
        builder: (BuildContext context, GoRouterState state) =>
            const GenderView()),
    //************* GetStartedView *************
    GoRoute(
        path: RouterPath.getStartedView,
        builder: (BuildContext context, GoRouterState state) =>
            const GetStartedView()),
    //************* SignUpView *************
    GoRoute(
        path: RouterPath.signUpView,
        builder: (BuildContext context, GoRouterState state) =>
            const SignUpView()),
    //************* SignInView *************
    GoRoute(
        path: RouterPath.signInView,
        builder: (BuildContext context, GoRouterState state) =>
            const SignInView()),
    //************* HomeView *************
    GoRoute(
        path: RouterPath.homeView,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeView()),
    //************* DetailsView *************
    GoRoute(
        path: RouterPath.detailsView,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
              create: (context) => CartCubit(getIt<CartRepo>()),
              child: DetailsView(
                product: state.extra as ProductDataModel,
              ),
            )),
    //************* BrandView *************
    GoRoute(
        path: RouterPath.brandView,
        builder: (BuildContext context, GoRouterState state) {
          return BrandView(
            brand: state.extra as CategoryDataModel,
          );
        }),
    //************* CartView *************
    GoRoute(
        path: RouterPath.favouriteView,
        builder: (BuildContext context, GoRouterState state) {
          return const FavouriteView();
        }),
    GoRoute(
        path: RouterPath.selectScreen,
        builder: (BuildContext context, GoRouterState state) =>
            MultiBlocProvider(providers: [
              BlocProvider(
                create: (context) =>
                    GetProfileCubit(getIt<HomeRepo>())..getProfile(),
              ),
              BlocProvider(
                create: (context) => HomeCubit(),
              ),
              BlocProvider(
                create: (context) =>
                    GetBrandCubit(getIt<HomeRepo>())..getBrand(),
              ),
              BlocProvider(
                create: (context) => CartCubit(getIt<CartRepo>()),
              ),
            ], child: const SelectScreen())),
    GoRoute(
        path: RouterPath.cartView,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
              create: (context) =>
                  CartCubit(getIt<CartRepo>())..getCartProducts(),
              child: const CartView(),
            )),
    GoRoute(
        path: RouterPath.paymentView,
        builder: (BuildContext context, GoRouterState state) =>
            const PaymentView()),
    GoRoute(
        path: RouterPath.orderConfirmedView,
        builder: (BuildContext context, GoRouterState state) =>
            const OrderConfirmedView()),
    GoRoute(
        path: RouterPath.addCardScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const AddCardScreen()),
  ],
);
