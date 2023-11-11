part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitialState extends CartState {}
class CartLoadingState extends CartState {}
class CartSuccessState extends CartState {}
class CartFailureState extends CartState {}
class ItemCountIncrement extends CartState {}
class AddOrRemoveProductLoadingState extends CartState {}
class AddOrRemoveProductSuccessState extends CartState {}
class AddAddressSuccess extends CartState {}
