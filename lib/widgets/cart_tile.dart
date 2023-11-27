import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustah_bakery/widgets/black_text.dart';

class CartTile extends StatefulWidget {
  final String name;
  final String image;
  final int quantity;
  const CartTile({
    super.key,
    required this.image,
    required this.name,
    required this.quantity,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
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
      height: MediaQuery.of(context).size.height * 0.10,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[100],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(widget.image))),
          ),
          const SizedBox(
            width: 10,
          ),
          BlackText(text: widget.name),
          Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      itemCount--;
                    });
                  },
                  child: Container(
                      width: 40,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepOrange),
                      child: const Center(
                          child: Text('—', style: TextStyle(fontSize: 20)))),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('${itemChecker(itemCount)}',
                      style: const TextStyle(fontSize: 18)),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      itemCount++;
                    });
                  },
                  child: Container(
                      width: 40,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepOrange),
                      child: const Center(
                          child: Text('+', style: TextStyle(fontSize: 20)))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
