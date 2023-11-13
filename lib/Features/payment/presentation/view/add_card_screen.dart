import 'package:e_commerce1/Features/payment/presentation/manager/get_cards_cubit/get_cards_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/style.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/repo/payment_repo.dart';
import '../manager/add_card_cubit/add_card_cubit.dart';
import 'widget/add_card_screen_body.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "payment",
          style: StyleManager.title1.copyWith(color: Colors.black),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              GoRouter.of(context).pop();
            }),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AddCardCubit(getIt<PaymentRepo>()),),
        ],

        child: const AddCardScreenBody(),
      ),
    );
  }
}
