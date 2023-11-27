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
          backgroundColor: const Color.fromARGB(255, 255, 110, 108),
        ),
        body: GetBuilder<ItemsController>(
          builder: (controller) {
            return ListView.builder(
              itemBuilder: ((context, index) {
                return CartTile(
                    image: controller.productsList[index],
                    name: controller.productsList[index],
                    quantity: controller.productsList[index]);
              }),
              itemCount: controller.productsList.length,
            );
          },
        ));
  }
}
