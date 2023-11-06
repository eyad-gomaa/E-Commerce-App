import 'package:e_commerce1/Features/home/presentation/manager/HomeCubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../cart/presentation/manager/cart_cubit.dart';
import '../manager/HomeCubit/home_state.dart';
import '../manager/get_product_cubit/get_product_cubit.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  getData() async {
    await BlocProvider.of<GetProductCubit>(context).getProducts();
    BlocProvider.of<GetProductCubit>(context).getFavouriteProducts();
    BlocProvider.of<CartCubit>(context).getCartProducts();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var homeCubit = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          bottomNavigationBar: GNav(
              padding: EdgeInsets.all(15),
              iconSize: 25,
              color: ColorManager.black,
              activeColor: ColorManager.primary,
              selectedIndex: homeCubit.currentIndex,
              gap: 8,
              onTabChange: (index) {
                BlocProvider.of<HomeCubit>(context).changeBottom(index);
              },
              tabs: [
                const GButton(
                  icon: FontAwesomeIcons.house,
                  text: 'Home',

                ),
                GButton(
                  icon: FontAwesomeIcons.solidHeart,
                  text: 'Favourite',
                  onPressed: () async {
                    // await BlocProvider.of<GetProductCubit>(context).getFavouriteProducts();
                  },
                ), GButton(
                  icon: FontAwesomeIcons.cartShopping,
                  text: 'Cart',
                  onPressed: () {
                    BlocProvider.of<CartCubit>(context)
                      ..getCartProducts();
                  },
                ),
                const GButton(
                  icon: FontAwesomeIcons.wallet,
                  text: 'Wallet',
                ),
              ]),
          body: homeCubit.bottomScreens[homeCubit.currentIndex],
        );
      },
    );
  }
}
