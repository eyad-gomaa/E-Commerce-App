import 'package:e_commerce1/Features/favourite/persintation/view/favourite_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cart/presentation/view/cart_view.dart';
import '../../../../payment/persentation/view/payment_view.dart';
import '../../view/home_view.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    const HomeView(),
    const FavouriteView(),
    const CartView(),
    const PaymentView(),
  ];
  void changeBottom(int index){
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
