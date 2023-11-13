import 'package:e_commerce1/Features/payment/data/repo/payment_repo.dart';
import 'package:e_commerce1/core/shared/constants.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/card_model.dart';

class PaymentRepoImpl extends PaymentRepo{
  @override
  addCard(CardModel card) async{
    var notesBox = Hive.box<CardModel>(kCardsBox);
    await notesBox.add(card);
  }

  @override
  Future<List<CardModel>> getCardData() async{
    var cardBox = Hive.box<CardModel>(kCardsBox);
    List<CardModel> cardList = cardBox.values.toList();
    return cardList;
  }

}