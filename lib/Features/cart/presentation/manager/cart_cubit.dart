import 'package:e_commerce1/Features/cart/data/repo/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/shared.dart';
import '../../data/model/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.repo) : super(CartInitialState());
  final CartRepo repo;
  CartModel? cartModel;
  String? editCartMessage;
  double? subtotal;
  Future<void>getCartProducts()async{
    emit(CartLoadingState());
    var result = await repo.getCartData();
    result.fold(
            (l) {
              l.errMessage;
              emit(CartFailureState());
            },
            (r) {
              emit(CartSuccessState());
              cartModel = r;
              subtotal = r.data!.subTotal!.toDouble();
            }
    );
  }
  Future<void> addOrRemoveProduct({required productId})async{
    inCartMap[productId] = !inCartMap[productId]!;
    emit(AddOrRemoveProductLoadingState());
    var result = await repo.addCartData(productId: productId);
    result.fold(
            (l) {
          l.errMessage;
        },
            (r) {
              emit(AddOrRemoveProductSuccessState());
              getCartProducts();
              editCartMessage  = r.message;
        }
    );
  }
  // itemCountIncrement(int index){
  //   int? itemCount;
  //   itemCount  = cartModel!.data!.cartItems[index].quantity;
  //   emit(ItemCountIncrement());
  //   itemCount =  itemCount! + 1;
  //   return itemCount;
  // }
}
