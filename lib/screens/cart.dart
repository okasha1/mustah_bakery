import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustah_bakery/data/controller/controller.dart';
import 'package:mustah_bakery/widgets/cart_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: Colors.deepOrange[400],
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return const CartTile(
                image: 'assets/images/pic1', name: 'Food', quantity: 4);
          }),
          itemCount: 4,
        ));
  }
}
