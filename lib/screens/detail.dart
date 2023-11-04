import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustah_bakery/data/controller/controller.dart';
import 'package:mustah_bakery/models/cart_model.dart';
import 'package:mustah_bakery/utilities/colors.dart';
import 'package:mustah_bakery/widgets/black_text.dart';

class ProductDetail extends StatefulWidget {
  final String? imageUrl;
  final String? name;
  final String? description;
  final int? price1;
  final int? price2;
  const ProductDetail(
      {super.key,
      this.imageUrl,
      this.name,
      this.description,
      this.price1,
      this.price2});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  ItemsController controller = Get.put(ItemsController());
  int itemCount = 1;

  static int get price1 => _ProductDetailState.price1;

  static int get price2 => _ProductDetailState.price2;

  static get imageUrl => _ProductDetailState.imageUrl;

  static get name => _ProductDetailState.name;

  static get description => _ProductDetailState.description;
  int itemChecker(int num) {
    if (num > 100) {
      return 100;
    } else if (num < 1) {
      itemCount = 1;
      return itemCount;
    }
    return num;
  }

  bool _tapped = false;

  int basicPrice = price1;
  int supremePrice = price2;
  int priceHolder = 50;

  @override
  Widget build(BuildContext context) {
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
              Text('₵${priceHolder * itemChecker(itemCount)}',
                  style: const TextStyle(fontSize: 30)),
              //The bottom Navigation button
              InkWell(
                onTap: () {
                  controller.productsList.add(CartModel(
                      image: 'assets/images/$imageUrl',
                      name: '$name',
                      quantity: itemChecker(itemCount)));
                },
                child: Container(
                  height: 90,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                      child:
                          Text('ADD TO CART', style: TextStyle(fontSize: 30))),
                ),
              )
            ],
          )),
      body: Stack(children: [
        Container(
          height: size.height * 0.45,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/$imageUrl'),
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
              BlackText(text: '$name'),
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
                height: 100,
                width: double.maxFinite,
                child: Text('$description',
                    style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Color.fromARGB(255, 43, 40, 40))),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //THE BASIC AND SUPREME BUTTONS
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!_tapped) {
                          _tapped = true;
                        } else {
                          _tapped = false;
                        }
                        priceHolder = basicPrice;
                      });
                    },
                    child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              _tapped ? AppColors.mainColor : Colors.grey[900],
                        ),
                        child: const Center(
                            child:
                                Text('Basic', style: TextStyle(fontSize: 16)))),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_tapped) {
                          _tapped = true;
                        } else {
                          _tapped = false;
                        }
                        priceHolder = supremePrice;
                      });
                    },
                    child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              _tapped ? AppColors.mainColor : Colors.grey[900],
                        ),
                        child: const Center(child: Text('Supreme'))),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              //THE ADD & SUB BUTTONS
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
