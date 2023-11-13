import 'package:e_commerce1/Features/payment/data/repo/payment_repo.dart';
import 'package:e_commerce1/Features/payment/presentation/manager/get_cards_cubit/get_cards_cubit.dart';
import 'package:e_commerce1/core/resources/style.dart';
import 'package:e_commerce1/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsListView extends StatelessWidget {
  const CardsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCardsCubit(getIt<PaymentRepo>())..getCards(),
      child: BlocBuilder<GetCardsCubit, GetCardsState>(
        builder: (context, state) {
          if (state is GetCardsSuccess) {
            if(state.cardList.isEmpty){
              return SizedBox(
                height: 185,
                child: Center(
                  child: Text(
                    "No Cards",
                    style: StyleManager.headLine3,
                  ),
                ),
              );
            }else{
              return SizedBox(
                height: 185,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.cardList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Stack(
                        children: [
                          Image.asset("assets/images/visa_card.png"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 25, left: 20),
                                child: SizedBox(
                                    width: 200,
                                    child: Text(
                                      state.cardList[index].name,
                                      style: const TextStyle(
                                          color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 50, left: 20),
                                child: Text(
                                  "Visa Classic",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 10, left: 20),
                                child: Text(
                                  state.cardList[index].cardNumber,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                               Padding(
                                padding: const EdgeInsets.only(top: 10, left: 20),
                                child: Text(
                                  state.cardList[index].exp,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              );
            }
          } else {
            return Text(
              "There is an error",
              style: StyleManager.headLine1,
            );
          }
        },
      ),
    );
  }
}
