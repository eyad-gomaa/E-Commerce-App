
import 'package:e_commerce1/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/resources/asset_manager.dart';
import '../../../../core/resources/color_manager.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  String? lastValidatedToken;
  @override
  void initState() {
    getValidationData();
    Future.delayed(const Duration(seconds: 2),(){
      if(lastValidatedToken == null){
          GoRouter.of(context).pushReplacement(RouterPath.genderView);
      }
      else{
        GoRouter.of(context).pushReplacement(RouterPath.selectScreen);
      }

    });
    super.initState();
  }
  getValidationData()async{
    final pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    setState(() {
      lastValidatedToken = token;
    });
  }
  clearPrefs()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: SizedBox(
          width: 60,
          height: 60,
          child: Image.asset(AssetManager.splashLogo),
        ),
      )
    );
  }
}
