import 'package:flutter/material.dart';
import 'package:mustah_bakery/utilities/colors.dart';
import 'package:mustah_bakery/widgets/black_text.dart';
import 'package:mustah_bakery/widgets/small_text.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.pink[50],
      bottomNavigationBar: Container(
          height: size.height * 0.1,
          width: double.maxFinite,
          color: Colors.deepOrangeAccent,
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(),
                child: const Text('Add To Cart'),
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
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 70,
                width: double.maxFinite,
                child: const Text(
                    'This is a small description of the product that you will begetting. This food comes in vareity of different flavors so you can from many menus.',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                        color: Color.fromARGB(255, 43, 40, 40))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //THE BASIC AND SUPREME BUTTONS
                  Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.mainColor,
                      ),
                      child: const Center(child: Text('Basic'))),
                  const SizedBox(width: 10),
                  Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.mainColor,
                      ),
                      child: const Center(child: Text('Supreme'))),
                ],
              ),
              Row(children: [
                Container(
                    height: 30,
                    width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue),
                    child: const Center(
                        child: Text('+', style: TextStyle(fontSize: 30)))),
                const Text('10', style: TextStyle(fontSize: 18)),
                Container(
                    height: 30,
                    width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue),
                    child: const Center(
                        child: Text('-', style: TextStyle(fontSize: 30)))),
              ])
            ]),
          ),
        )
      ]),
    );
  }
}
