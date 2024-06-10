import 'package:ecommerce_app/pages/intro_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce_app/login/signin_screen.dart';
import 'package:ecommerce_app/login/signup_screen.dart';
import 'package:ecommerce_app/login/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseOptions options = const FirebaseOptions(
    apiKey: "AIzaSyBcfZ58QkQYsDwILI2s_VMLDcM4mkASEGM",
    appId: "1:502840816868:android:adb5d5cc27ab352a54e8f1",
    messagingSenderId: "502840816868",
    projectId: "ecom-sweatshirt-auth",
  );

  await Firebase.initializeApp(options: options);

  // Initialize Cart and load cart items
  final cart = Cart();
  await cart.loadCart();

  runApp(MyApp(cart: cart));
}

class MyApp extends StatelessWidget {
  final Cart cart;

  const MyApp({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: cart,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/welcome',
        routes: {
          '/welcome': (context) => WelcomeScreen(),
          '/signin': (context) => SignInScreen(),
          '/signup': (context) => SignUpScreen(),
          '/intro_page': (context) => const IntroPage(),
        },
      ),
    );
  }
}
