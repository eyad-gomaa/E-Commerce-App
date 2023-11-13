
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/card_model.dart';
import '../../../data/repo/payment_repo.dart';

part 'get_cards_state.dart';

class GetCardsCubit extends Cubit<GetCardsState> {
  GetCardsCubit(this.repo) : super(GetCardsInitial());
  final PaymentRepo repo;

  void getCards()async{
    try {
      List<CardModel> cardList = await repo.getCardData();
      emit(GetCardsSuccess(cardList: cardList));
    } on Exception catch (e) {
      emit(GetCardsFailure());
    }
  }
}
