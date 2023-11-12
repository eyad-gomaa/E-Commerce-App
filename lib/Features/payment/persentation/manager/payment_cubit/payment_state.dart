part of 'payment_cubit.dart';
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}
class AddPaymentSuccess extends PaymentState {}
class AddCardLoading extends PaymentState {}
class AddCardSuccess extends PaymentState {}
class AddCardFailure extends PaymentState {}
