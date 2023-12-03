import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustah_bakery/data/controller/controller.dart';
import 'package:mustah_bakery/widgets/black_text.dart';

class CartTile extends StatefulWidget {
  int index;

  CartTile({super.key, required this.index});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  ItemsController controller = Get.put(ItemsController());
  int itemCount = 1;

  int itemChecker(int num) {
    if (num > 100) {
      Get.snackbar('Exceeding Limit', "You can't order more than 100",
          backgroundColor: const Color.fromARGB(255, 255, 162, 22));
      return 100;
    } else if (num < 1) {
      itemCount = 1;
      return itemCount;
    }
    return num;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
      height: MediaQuery.of(context).size.height * 0.15,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[100],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        controller.productsList[widget.index].image))),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                BlackText(
                  text: controller.productsList[widget.index].name,
                ),
                const SizedBox(
                  height: 35,
                ),
                Text((controller.productsList[widget.index].price *
                        itemChecker(
                            controller.productsList[widget.index].quantity))
                    .toString())
              ],
            ),
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        itemChecker(
                            controller.productsList[widget.index].quantity++);
                      });
                    },
                    // splashRadius: 5,
                    iconSize: 24,

                    icon: const Icon(Icons.add_circle_outline),
                  ),
                  Text(
                    '${itemChecker(controller.productsList[widget.index].quantity)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          itemChecker(
                              controller.productsList[widget.index].quantity--);
                        });
                      },
                      iconSize: 24,
                      icon: const Icon(Icons.remove_circle_outline)),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              IconButton.outlined(
                onPressed: () {
                  controller
                      .deleteProduct(controller.productsList[widget.index]);
                },
                icon: const Icon(Icons.delete),
                color: Colors.red,
              )
            ],
          )
        ],
      ),
    );
  }
}
