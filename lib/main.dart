import 'package:firebase_core/firebase_core.dart';
import 'package:flowerss/firebase_options.dart';
import 'package:flowerss/views/Login_view.dart';
import 'package:flowerss/views/cart_page.dart';
import 'package:flowerss/views/checkout_page.dart';
import 'package:flowerss/views/contact_us1_page.dart';
import 'package:flowerss/views/favourit_page.dart';
import 'package:flowerss/views/payment_page.dart';
import 'package:flowerss/views/profile_page.dart';
import 'package:flowerss/views/success_contact_page.dart';
import 'package:flowerss/views/home_view.dart';
import 'package:flowerss/views/log_out_page.dart';
import 'package:flowerss/views/register_page.dart';
import 'package:flowerss/views/splash_screen.dart';
import 'package:flowerss/views/verified_page.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('firebase donnnnnne');
  runApp(const FloworaApp());
}

class FloworaApp extends StatelessWidget {
  const FloworaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id: (context) => HomePage(),
        RegisterPage.id: (context) => RegisterPage(),
        LoginPage.id: (context) => LoginPage(),
        VerifiedPage.id: (context) => VerifiedPage(),
        LogOutPage.id: (context) => LogOutPage(),
        succesContact.id: (context) => succesContact(),
        ContactUs1Page.id: (context) => ContactUs1Page(),
        ProfilePage.id: (context) => ProfilePage(),
        FavoritesPage.id: (context) => FavoritesPage(),
        CartPage.id: (context) => CartPage(),
        CheckoutPage.id: (context) => CheckoutPage(),
        PaymentPage.id: (context) => PaymentPage(),
      },
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
