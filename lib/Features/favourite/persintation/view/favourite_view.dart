import 'package:e_commerce1/Features/favourite/persintation/view/widget/favourite_view_body.dart';
import 'package:e_commerce1/core/resources/color_manager.dart';
import 'package:e_commerce1/core/resources/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/presentation/manager/get_product_cubit/get_product_cubit.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductCubit, GetProductState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(

            title: Text("favourite",
              style: StyleManager.headLine3.copyWith(
                  color: ColorManager.black),),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: const SafeArea(
              child: FavouriteViewBody()
          ),
        );
      },
    );
  }
}
