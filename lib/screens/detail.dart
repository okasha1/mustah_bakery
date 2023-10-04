import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustah_bakery/utilities/colors.dart';
import 'package:mustah_bakery/widgets/black_text.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

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

  bool tapped = false;
  int miniPrice = 50;
  int basicPrice = 80;
  int supremmePrice = 130;
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
                onTap: () {},
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
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/pizza.jpg'),
                  fit: BoxFit.fill)),
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
              const BlackText(text: 'Description'),
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
                child: const Text(
                    'This is a small description of the product that you will begetting. This food comes in vareity of different flavors so you can from many menus.',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Color.fromARGB(255, 43, 40, 40))),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //THE BASIC AND SUPREME BUTTONS
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tapped = true;
                        priceHolder = miniPrice;
                      });
                    },
                    child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              tapped ? AppColors.mainColor : Colors.grey[900],
                        ),
                        child: const Center(child: Text('Mini'))),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tapped = true;
                        priceHolder = basicPrice;
                      });
                    },
                    child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              tapped ? AppColors.mainColor : Colors.grey[900],
                        ),
                        child: const Center(
                            child:
                                Text('Basic', style: TextStyle(fontSize: 16)))),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tapped = true;
                        priceHolder = supremmePrice;
                      });
                    },
                    child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              tapped ? AppColors.mainColor : Colors.grey[900],
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
