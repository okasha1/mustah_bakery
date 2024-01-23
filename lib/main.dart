import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustah_bakery/screens/homepage.dart';
import 'package:mustah_bakery/screens/login_signup_screen/initial_wrapper.dart';
import 'package:mustah_bakery/screens/login_signup_screen/login.dart';
import 'package:mustah_bakery/screens/profile.dart';
import 'package:mustah_bakery/screens/login_signup_screen/signup.dart';
import 'package:mustah_bakery/screens/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red,
      useMaterial3: true,
    ),
    home: Scaffold(
      backgroundColor: Colors.red[400],
      body: const SignUpScreen(),
    ),
    routes: {
      '/login': (context) => const LoginScreen(),
      '/signUp': (context) => const SignUpScreen(),
      '/homePage': (context) => const HomeScreen(),
      '/profile': (context) => const ProfilePage()
    },
  ));
}
