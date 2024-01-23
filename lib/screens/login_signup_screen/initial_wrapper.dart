import 'package:flutter/material.dart';

class Initial extends StatefulWidget {
  const Initial({super.key});

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text('Welcome to Mustah Bakery,\n Login or Sign Up'),
              SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: Image.asset('assets/images/logo.jpg')),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Login'),
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Sign Up'))
            ],
          ),
        ),
      ),
    );
  }
}
