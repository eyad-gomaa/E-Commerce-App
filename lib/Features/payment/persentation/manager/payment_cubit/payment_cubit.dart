
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  String? ownerName;
  String? cardNumber;
  String? exp;
  String? cvv;

  setCardData({required String ownerName,required String cardNumber,required String exp,required String cvv }){
    this.ownerName = ownerName;
    this.cardNumber = cardNumber;
    this.exp = exp;
    this.cvv = cvv;
    emit(AddPaymentSuccess());
  }
}
