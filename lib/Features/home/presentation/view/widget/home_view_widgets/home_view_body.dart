import 'package:e_commerce1/core/resources/style.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/resources/app_size.dart';
import 'home_app_bar.dart';
import 'home_brands_section.dart';
import 'home_search.dart';
import 'new_arrival_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.s20),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // AppBar
            const HomeAppBar(),
            // welcome text
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: PaddingSize.s20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: StyleManager.headLine1,
                    ),
                    Text(
                      "Welcome to Laza.",
                      style: StyleManager.subtitle,
                    ),
                  ],
                ),
              ),
            ),
            //Search
            const SliverToBoxAdapter(
              child: HomeSearch(),
            ),
            //Brands Section
            const SliverToBoxAdapter(
              child: HomeBrandsSection(),
            ),
            //New Arrival Section
             const SliverToBoxAdapter(
              child: NewArrivalSection(),
            ),
          ],
        ),
      ),
    );
  }
}
