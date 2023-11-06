import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/style.dart';
import 'widget/add_card_screen_body.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("payment",style: StyleManager.title1.copyWith(color: Colors.black),),
        leading:IconButton(icon: Icon(Icons.arrow_back_outlined), onPressed: (){GoRouter.of(context).pop();}),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: AddCardScreenBody(),
    );
  }
}
