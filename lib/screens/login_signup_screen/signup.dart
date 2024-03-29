import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:mustah_bakery/data/helper/firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  FirebaseAuthHelper firebaseAuthHelper = FirebaseAuthHelper();

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create an account \nto be part of the family",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email...',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(239, 83, 80, 1))),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(239, 83, 80, 1)),
                      borderRadius: BorderRadius.circular(20)),
                ),
                controller: _email,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your password...',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(239, 83, 80, 1))),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(239, 83, 80, 1)),
                      borderRadius: BorderRadius.circular(20)),
                ),
                controller: _password,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    final email = _email.text;
                    final password = _password.text;
                    firebaseAuthHelper.signUp(email, password);
                  } catch (e) {
                    AnimatedSnackBar.rectangle(
                      e.toString(),
                      ' Enter valid email and password.',
                      type: AnimatedSnackBarType.error,
                      brightness: Brightness.light,
                    ).show(
                      context,
                    );
                  }
                },
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red[400],
                    ),
                    alignment: Alignment.bottomCenter,
                    child: const Center(
                        child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 15),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
