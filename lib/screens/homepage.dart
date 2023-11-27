import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustah_bakery/models/product_model.dart';
import 'package:mustah_bakery/screens/popular_detail.dart';
import 'package:mustah_bakery/screens/recommended_detail.dart';
import 'package:mustah_bakery/widgets/black_text.dart';
import 'package:mustah_bakery/widgets/food_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String name = 'Okasha';
  List<Product> popular = Product.popularProducts;
  List<Product> recommended = Product.recommendedProducts;
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
                                    individualProduct: popular[index],
                                  )),
                              child: Container(
                                height: 200,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/popular/${popular[index].image}'),
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
                                          text: '${popular[index].name}',
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
                        itemCount: popular.length,
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
                            itemCount: Product.recommendedProducts.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                //Button to the product detail
                                onTap: () =>
                                    Get.to(() => RecommendedProductDetail(
                                          individualProduct: recommended[index],
                                        )),
                                child: RecommendedFoodTile(
                                    imageItem:
                                        'assets/images/recommended/${recommended[index].image}',
                                    name: '${recommended[index].name}',
                                    description:
                                        '${recommended[index].description}'),
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
