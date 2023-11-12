import 'package:hive/hive.dart';
part 'card_model.g.dart';
@HiveType(typeId: 0)
class CardModel extends HiveObject{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String cardNumber;
  @HiveField(2)
  final String exp;
  @HiveField(3)
  final String cvv;

  CardModel({required this.name, required this.cardNumber, required this.exp, required this.cvv});
}