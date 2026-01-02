import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_elegance/cubits/get_product_cubit/get_product_cubit.dart';
import 'package:her_elegance/cubits/get_wish_list_cubit/get_wish_list_cubit.dart';
import 'package:her_elegance/firebase_options.dart';
import 'package:her_elegance/screens/cart_screen.dart';
import 'package:her_elegance/screens/check_out_screen.dart';
import 'package:her_elegance/screens/home_screen.dart';
import 'package:her_elegance/screens/login_screen.dart';
import 'package:her_elegance/screens/onboarding_screen.dart';
import 'package:her_elegance/screens/product_details_screen.dart';
import 'package:her_elegance/screens/profile_screen.dart';
import 'package:her_elegance/screens/register_screen.dart';
import 'package:her_elegance/screens/splash_screen.dart';
import 'package:her_elegance/screens/wish_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(HerElegance());
}

class HerElegance extends StatelessWidget {
  const HerElegance({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => WishListCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          LoginScreen.id: (conttext) => LoginScreen(),
          RegisterScreen.id: (conttext) => RegisterScreen(),
          OnboardingScreen.id: (context) => OnboardingScreen(),
          SplashScreen.id: (context) => SplashScreen(),
          CartScreen.id: (context) => CartScreen(),
          ProductDetailsScreen.id: (context) => ProductDetailsScreen(),
          WishListScreen.id: (context) => WishListScreen(),
          CheckOutScreen.id: (context) => CheckOutScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
        },
        initialRoute: OnboardingScreen.id,
      ),
    );
  }
}
