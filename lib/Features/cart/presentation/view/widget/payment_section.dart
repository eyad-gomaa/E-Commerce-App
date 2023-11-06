import 'package:e_commerce1/core/utils/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/resources/style.dart';
import '../../../../payment/persentation/manager/payment_cubit/payment_cubit.dart';
import 'cart_details.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment Method",
                style: StyleManager.headLine3,
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(RouterPath.paymentView);
                },
                child: CartDetailsCard(
                  title: BlocProvider
                      .of<PaymentCubit>(context)
                      .ownerName ?? "No current method",
                  img: "assets/images/visa_word.png",
                  subTitle: BlocProvider
                      .of<PaymentCubit>(context)
                      .cardNumber ?? "tap to add payment method",
                ),
              )
            ],
          ),
        );
      },
    );
  }
}