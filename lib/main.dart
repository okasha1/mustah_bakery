import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustah_bakery/data/helper/dependencies.dart' as dep;
import 'package:mustah_bakery/models/product_model.dart';
import 'package:mustah_bakery/screens/detail.dart';
import 'package:mustah_bakery/screens/homepage.dart';
import 'package:mustah_bakery/screens/login.dart';
import 'package:mustah_bakery/screens/profile.dart';
import 'package:mustah_bakery/screens/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.red),
    home: Scaffold(
      backgroundColor: Colors.red[400],
      body: const ProfilePage(),
    ),
    routes: {
      '/login': (context) => const LoginScreen(),
      '/signUp': (context) => const SignUpScreen(),
      '/homePage': (context) => const HomeScreen(),
      'productDetail': (context) => const ProductDetail()
    },
  ));
}
