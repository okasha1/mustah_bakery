import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustah_bakery/data/controller/controller.dart';
import 'package:mustah_bakery/models/cart_model.dart';
import 'package:mustah_bakery/widgets/cart_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    ItemsController controller = Get.put(ItemsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 110, 108),
        ),
        body: controller.productsList.isEmpty
            ? const Text('No items in the cart')
            : ListView.builder(
                itemCount: controller.productsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CartTile(
                        image: controller.productsList[index].image,
                        name: controller.productsList[index].name,
                        quantity: controller.productsList[index].quantity),
                  );
                }));
  }
}
