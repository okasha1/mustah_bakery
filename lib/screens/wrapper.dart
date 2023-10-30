import 'package:flutter/material.dart';
import 'package:mustah_bakery/screens/cart.dart';
import 'package:mustah_bakery/screens/homepage.dart';
import 'package:mustah_bakery/screens/profile.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final List<Widget> pages = [
    const HomeScreen(),
    const CartPage(),
    const ProfilePage(),
  ];

  int _currentIndex = 0;

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        unselectedItemColor: Colors.black87,
        currentIndex: _currentIndex,
        onTap: changePage,
      ),
    );
  }
}
