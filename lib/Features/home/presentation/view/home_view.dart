import 'package:e_commerce1/Features/home/presentation/view/widget/home_view_widgets/home_drawer.dart';
import 'package:e_commerce1/Features/home/presentation/view/widget/home_view_widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: HomeDrawer(),
      body: HomeViewBody()
    );
  }
}
