import 'package:e_commerce1/Features/address/presentation/view/widget/address_view_body.dart';
import 'package:e_commerce1/core/resources/color_manager.dart';
import 'package:e_commerce1/core/resources/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){GoRouter.of(context).pop();}, icon:  Icon(Icons.arrow_back_outlined,color: ColorManager.black,)),
        centerTitle: true,
        title:  Text("Address",style: StyleManager.title1.copyWith(color: ColorManager.black,),),
      ),
      body: const AddressViewBody(),
    );
  }
}
