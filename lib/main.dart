import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'Features/address/presentation/manager/address_cubit.dart';
import 'Features/home/data/repos/home_repo.dart';
import 'Features/home/presentation/manager/get_product_cubit/get_product_cubit.dart';
import 'Features/payment/data/model/card_model.dart';
import 'Features/payment/data/repo/payment_repo.dart';
import 'Features/payment/persentation/manager/payment_cubit/payment_cubit.dart';
import 'core/shared/constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'firebase_options.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kCardsBox);
  Hive.registerAdapter(CardModelAdapter());

  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetProductCubit(getIt<HomeRepo>()),
        ),
        BlocProvider(
          create: (context) => PaymentCubit(),
        ),
        BlocProvider(
          create: (context) => AddressCubit(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}

