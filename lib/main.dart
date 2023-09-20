import 'package:flutter/material.dart';
import 'package:mustah_bakery/data/helper/dependencies.dart' as dep;
import 'package:mustah_bakery/screens/detail.dart';
import 'package:mustah_bakery/screens/homepage.dart';
import 'package:mustah_bakery/screens/login.dart';
import 'package:mustah_bakery/screens/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.red),
    home: Scaffold(
      backgroundColor: Colors.red[400],
      body: const ProductDetail(),
    ),
    routes: {
      '/login': (context) => const LoginScreen(),
      '/signUp': (context) => const SignUpScreen(),
      '/homePage': (context) => const HomeScreen(),
    },
  ));
}
