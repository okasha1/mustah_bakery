import 'package:flutter/material.dart';
import 'package:mustah_bakery/widgets/black_text.dart';
import 'package:mustah_bakery/widgets/small_text.dart';

class RecommendedFoodTile extends StatelessWidget {
  final String imageItem;
  final String name;
  final String description;
  const RecommendedFoodTile(
      {super.key,
      required this.imageItem,
      required this.name,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(imageItem),
                  fit: BoxFit.fill,
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 100,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlackText(text: name),
                  SmallText(
                    text: description,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Row(
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
