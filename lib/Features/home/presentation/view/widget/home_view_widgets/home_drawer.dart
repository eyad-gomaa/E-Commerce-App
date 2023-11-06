import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce1/Features/home/presentation/manager/get_profile_cubit/get_profile_cubit.dart';
import 'package:e_commerce1/Features/home/presentation/view/widget/home_view_widgets/custom_progress_indicator.dart';
import 'package:e_commerce1/core/resources/color_manager.dart';
import 'package:e_commerce1/core/resources/style.dart';
import 'package:e_commerce1/core/utils/app_router.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/resources/app_size.dart';
import 'drawer_item.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: PaddingSize.s20),
            child: Column(
                children:[
                  //********** pop Button **********
                  Row(
                      children:[
                        Padding(
                          padding:  const EdgeInsets.symmetric(vertical: PaddingSize.s20),
                          child: IconButton(
                            icon: const Icon(FontAwesomeIcons.arrowLeft,),
                            onPressed: (){
                              Scaffold.of(context).closeDrawer();
                            },
                          ),
                        )
                      ]
                  ),
                  //********** Profile Card **********
                   ProfileCard(),
                  //********** options **********
                  Column(
                    children: [
                      const SizedBox(height: AppSize.s30,),
                      //********** Dark Mode **********
                      const DarkModeOption(),
                      //********** Account Information **********
                      DrawerItem(icon: FeatherIconsSnakeCase.alert_circle,title: "Account Information",onTap: (){}),
                      //********** Password **********
                      DrawerItem(icon: FeatherIconsSnakeCase.lock,title: "Password",onTap: (){}),
                      //********** Orders **********
                      DrawerItem(icon: Icons.shopping_bag_outlined,title: "Orders",onTap: (){GoRouter.of(context).push(RouterPath.cartView);}),
                      //********** My Cards **********
                      DrawerItem(icon: FeatherIconsSnakeCase.credit_card,title: "My Cards",onTap: (){GoRouter.of(context).push(RouterPath.paymentView);}),
                      //********** Wishlist **********
                      DrawerItem(icon: FontAwesomeIcons.heart,title: "Wishlist",onTap: (){GoRouter.of(context).push(RouterPath.favouriteView);}),
                      //********** Settings **********
                      DrawerItem(icon: FeatherIconsSnakeCase.settings,title: "Settings",onTap: (){}),
                      const SizedBox(height: AppSize.s30,),
                      //********** Logout **********
                      const LogOutItem()

                    ],
                  )
                ]
            ),
          ),
        )
    );
  }
}

class LogOutItem extends StatelessWidget {
  const LogOutItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove("token");
        GoRouter.of(context).push(RouterPath.splashView);
        },
      child: Container(
        height: 50,
        child: Row(
          children: [
            Icon(FeatherIconsSnakeCase.log_out,color: ColorManager.redColor,),
            const SizedBox(width: AppSize.s10,),
            Text("Logout",style: StyleManager.headLine3,),

          ],
        ),
      ),
    );
  }
}

class DarkModeOption extends StatelessWidget {
  const DarkModeOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(FeatherIconsSnakeCase.sun),
              const SizedBox(width: AppSize.s10,),
              Text("Dark Mood",style: StyleManager.headLine3,),
            ],
          ),
          Switch(
              value: false,
              onChanged: (value){},
              activeColor: ColorManager.primary,
          )
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileCubit, GetProfileState>(
  builder: (context, state) {
    if (state is GetProfileSuccess){
      if(state.profileModel.status == true){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 45,
                  height: 45,
                  child: CircleAvatar(
                    backgroundColor: ColorManager.darkWhite,
                    radius: 50,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: state.profileModel.data!.image!,
                      errorWidget: (context, url, error) => const Icon(Icons.error_outline),
                    ),
                  ),
                ),
                const SizedBox(width: AppSize.s15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.profileModel.data!.name!,style: StyleManager.headLine3,),
                    Text("Verified Profile",style: StyleManager.subtitle2,),
                  ],
                ),
              ],
            ),
            Container(
              width: 66,
              height: 32,
              decoration: BoxDecoration(
                color: ColorManager.darkWhite,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text(
                "${state.profileModel.data!.points!.toString()} points",style: StyleManager.subtitle2,)),
            )
          ],
        );
      }
      else{
        return Text("");
      }
    }else if(state is GetProfileFailure){
      return Text(state.errMessage);
    }else{
      return CustomProgressIndicator();
    }
  },
);
  }
}
