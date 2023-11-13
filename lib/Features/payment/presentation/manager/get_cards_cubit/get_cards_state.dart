part of 'get_cards_cubit.dart';

abstract class GetCardsState {}

class GetCardsInitial extends GetCardsState {}
class GetCardsSuccess extends GetCardsState {
  final List<CardModel> cardList;

  GetCardsSuccess({required this.cardList});
}
class GetCardsFailure extends GetCardsState {}
