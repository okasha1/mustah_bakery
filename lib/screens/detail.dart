import 'package:flutter/material.dart';
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
          child: const Column(children: [
            BlackText(text: 'Description'),
            Row(
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
            SmallText(
              text: '''This is a small description of the product. 
                  This food comes in vareity of different flavors so you can from many menus.''',
            )
          ]),
        )
      ]),
    );
  }
}
