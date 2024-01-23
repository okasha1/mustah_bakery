import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustah_bakery/data/controller/controller.dart';
import 'package:mustah_bakery/models/cart_model.dart';

import 'package:mustah_bakery/models/product_model.dart';
import 'package:mustah_bakery/utilities/colors.dart';
import 'package:mustah_bakery/widgets/black_text.dart';

class ProductDetail extends StatefulWidget {
  final Product individualProduct;
  const ProductDetail({
    super.key,
    required this.individualProduct,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int itemCount = 1;

  int itemChecker(int num) {
    if (num > 100) {
      return 100;
    } else if (num < 1) {
      itemCount = 1;
      return itemCount;
    }
    return num;
  }

  @override
  Widget build(BuildContext context) {
    ItemsController controller = Get.put(ItemsController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.pink[50],
      bottomNavigationBar: Container(
          height: size.height * 0.08,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.maxFinite,
          color: Colors.deepOrange[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  '₵${widget.individualProduct.price1 * itemChecker(itemCount)}',
                  style: const TextStyle(fontSize: 30)),
              //The bottom Navigation button
              GetBuilder<ItemsController>(builder: (controller) {
                return InkWell(
                  onTap: () {
                    controller.addProduct(CartModel(
                        image: '${widget.individualProduct.image}',
                        name: '${widget.individualProduct.name}',
                        quantity: itemChecker(itemCount),
                        price:
                            widget.individualProduct.price1.floorToDouble()));
                  },
                  child: Container(
                    height: 90,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                        child: Text('ADD TO CART',
                            style: TextStyle(fontSize: 30))),
                  ),
                );
              })
            ],
          )),
      body: Stack(children: [
        Container(
          height: size.height * 0.45,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('${widget.individualProduct.image}'),
                  fit: BoxFit.fill)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 10),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: const Color.fromARGB(255, 255, 174, 149),
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                color: Colors.black,
                icon: const Icon(Icons.arrow_back_ios_new)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.42),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: size.height * 0.6,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[100]),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(children: [
              BlackText(text: widget.individualProduct.name.toString()),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Normal')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.deepOrange,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('1.7km')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timeline,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('32min')
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 125,
                width: double.maxFinite,
                child: Text(widget.individualProduct.description.toString(),
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Color.fromARGB(255, 43, 40, 40))),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //THE BASIC AND SUPREME BUTTONS
                  SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 20),
              //THE INCREMENT & DECREMENT BUTTONS
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      itemCount--;
                    });
                  },
                  child: Container(
                      width: 60,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepOrange),
                      child: const Center(
                          child: Text('—', style: TextStyle(fontSize: 20)))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${itemChecker(itemCount)}',
                      style: const TextStyle(fontSize: 20)),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      itemCount++;
                    });
                  },
                  child: Container(
                      width: 60,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepOrange),
                      child: const Center(
                          child: Text('+', style: TextStyle(fontSize: 20)))),
                ),
              ])
            ]),
          ),
        )
      ]),
    );
  }
}
