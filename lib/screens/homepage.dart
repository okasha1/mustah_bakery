import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustah_bakery/models/product_model.dart';
import 'package:mustah_bakery/screens/detail.dart';
import 'package:mustah_bakery/widgets/black_text.dart';
import 'package:mustah_bakery/widgets/food_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> popularProducts = [
    Product(
      name: 'Cake',
      image: 'pinkCake.jpg',
      description:
          "Celebrate the birthday of your favorite app with a custom-made cake! We can create a cake in any shape, size, and flavor you choose, and decorate it with the app's logo, colors, and characters.",
      price1: 180,
      price2: 300,
    ),
    Product(
        name: 'Pizza',
        image: 'slice.jpg',
        description:
            "A delicious and versatile food that can be enjoyed by people of all ages,made with fresh, high-quality ingredients and cooked to perfection. \n Order your pizza today!",
        price1: 80,
        price2: 120),
    Product(
        name: 'Jollof Rice',
        image: 'jollof.jpg',
        description:
            "A delicious and savory West African rice dish made with long-grain rice, tomatoes, peppers, onions, spices, and sometimes other vegetables and/or meat. Jollof rice is a popular dish in many West African countries and is often served for parties and gatherings. Order your jollof rice today and enjoy.",
        price1: 40,
        price2: 70),
    Product(
        name: "Cup Cake",
        image: 'cupcake.jpg',
        description:
            "Delicious and moist cakes baked in small, individual molds and decorated with frosting, icing, sprinkles, and other toppings. Cupcakes are a perfect treat for any occasion!",
        price1: 10,
        price2: 13),
    Product(
        name: 'Spring Rolls',
        image: 'springroll.jpg',
        description:
            "Crispy and delicious spring rolls made with a thin pastry sheet wrapped around a savory filling and deep-fried or baked. Spring rolls are a perfect appetizer or snack for any occasion!Order your spring rolls today and enjoy.",
        price1: 15,
        price2: 35),
  ];
  List<Product> recommendedProducts = [
    Product(
        name: 'Salad',
        image: 'salad.jpg',
        description:
            "A delicious and healthy dish made with mixed raw or cooked vegetables, fruits, nuts, seeds, grains, meat, poultry, or seafood. Salads are a perfect meal option for any occasion. Order your salad today and enjoy a taste of freshness!",
        price1: 40,
        price2: 75),
    Product(
        name: 'Fried Chips',
        image: 'friedchips.jpg',
        description:
            "Crispy and delicious fried chips made with thinly sliced potatoes and fried in hot oil until golden brown. Fried chips are a perfect snack or side dish for any occasion! Order your fried chips today and enjoy a classic treat!",
        price1: 20,
        price2: 35),
    Product(
        name: 'Pie',
        image: 'pie.jpg',
        description:
            "A delicious and flaky pastry crust filled with a variety of sweet or savory ingredients, baked to perfection. Pies are a classic dessert that can be enjoyed by people of all ages. Order your pie today and indulge in a sweet or savory treat!",
        price1: 20,
        price2: 30),
    Product(
        name: 'Vanilla Cup Cake',
        image: 'cupcake.jpg',
        description:
            "A moist and fluffy vanilla cake topped with sweet and creamy vanilla frosting. A classic dessert that is perfect for any occasion.",
        price1: 15,
        price2: 25)
  ];
  final String name = 'Okasha';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mustah Bakery',
          style: TextStyle(fontFamily: 'Niconne', fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 110, 108),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: double.maxFinite,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text('Hey '),
                      Text(
                        name,
                        style: const TextStyle(
                            fontFamily: 'Niconne', fontSize: 20),
                      )
                    ],
                  ),
                  const Text(
                    "Weija, Accra",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                //physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 300,
                      child: Swiper(
                        loop: false,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(children: [
                            GestureDetector(
                              onTap: () => Get.to(() => ProductDetail(
                                    name: '${popularProducts[index].name}',
                                    imageUrl: '${popularProducts[index].image}',
                                    description:
                                        '${popularProducts[index].description}',
                                    price1: popularProducts[index].price1,
                                    price2: popularProducts[index].price2,
                                  )),
                              child: Container(
                                height: 200,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/popular/${popularProducts[index].image}'),
                                        fit: BoxFit.fill),
                                    color: index.isEven
                                        ? Colors.amber
                                        : Colors.blue),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 30.0),
                                height: 100,
                                width: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[100]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BlackText(
                                          text:
                                              '${popularProducts[index].name}',
                                        ),
                                        Wrap(
                                            children: List.generate(
                                                5,
                                                (index) => const Icon(
                                                      Icons
                                                          .star_border_purple500,
                                                      color: Colors.deepOrange,
                                                    ))),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                      ]),
                                ),
                              ),
                            )
                          ]);
                        },
                        itemCount: popularProducts.length,
                        viewportFraction: 0.8,
                        scale: 0.9,
                        pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                                color: Colors.grey,
                                activeColor: Colors.deepOrange)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const BlackText(
                      text: 'Recommended :',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //RECOMMENDED LIST
                    SingleChildScrollView(
                      child: Expanded(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: recommendedProducts.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                //Button to the product detail
                                onTap: () =>
                                    Get.to(() => const ProductDetail()),
                                child: RecommendedFoodTile(
                                    imageItem:
                                        'assets/images/recommended/${recommendedProducts[index].image}',
                                    name: '${recommendedProducts[index].name}',
                                    description:
                                        '${recommendedProducts[index].description}'),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
