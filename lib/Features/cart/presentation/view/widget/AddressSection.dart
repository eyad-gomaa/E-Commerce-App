// ignore_for_file: file_names

import 'package:e_commerce1/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/resources/style.dart';
import '../../../../address/presentation/manager/address_cubit.dart';
import 'cart_details.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){GoRouter.of(context).push(RouterPath.addressView);},
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery Address",
              style: StyleManager.headLine3,
            ),
             BlocBuilder<AddressCubit, AddressState>(
  builder: (context, state) {
    return CartDetailsCard(
              title: BlocProvider.of<AddressCubit>(context).name ?? "No Current Address",
              img: "assets/images/map.png",
              subTitle: BlocProvider.of<AddressCubit>(context).country ?? "Tap to add data",
            );
  },
)
          ],
        ),
      ),
    );
  }
}