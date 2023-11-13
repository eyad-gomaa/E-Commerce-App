import '../model/card_model.dart';

abstract class PaymentRepo {
  Future <void> addCard(CardModel card);
  Future <List<CardModel>> getCardData();
}