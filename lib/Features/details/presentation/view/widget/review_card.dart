import 'package:flutter/material.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style.dart';
import '../../../../home/data/model/Reviews.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key, required this.review}) : super(key: key);
  final Reviews review;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //************* Reviewer Image *************
                    CircleAvatar(
                      radius: 15,
                      child: Image.network(review.image!),
                    ),
                    //******************************************
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //************* Reviewer Name *************
                        Text(
                          review.name!,
                          style: StyleManager.title1,
                        ),
                        //*****************************************
                        //************* time *************
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              size: 11,
                              color: ColorManager.lightGrey,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              review.time.toString(),
                              style: StyleManager.subtitle2,
                            ),
                          ],
                        )
                        //********************************
                      ],
                    ),
                  ],
                ),
                //************* Rating *************
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          review.rating.toString(),
                          style: StyleManager.title1,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "rating",
                          style: StyleManager.subtitle2,
                        )
                      ],
                    ),
                    //Get Rating Function
                    getRating()
                  ],
                )
                //**********************************
              ],
            )
          ],
        ),
        //************* Review *************
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            review.review!,
            style: StyleManager.subtitle,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        //**********************************
      ],
    );
  }

  getRating() {
    if (review.rating! <= 5) {
      return const Row(
        children: [
          Icon(
            Icons.star_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
        ],
      );
    } else if (review.rating! <= 4) {
      return const Row(
        children: [
          Icon(
            Icons.star_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
        ],
      );
    } else if (review.rating! <= 3) {
      return const Row(
        children: [
          Icon(
            Icons.star_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
        ],
      );
    } else if (review.rating! <= 2) {
      return const Row(
        children: [
          Icon(
            Icons.star_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
        ],
      );
    } else if (review.rating! <= 1) {
      return const Row(
        children: [
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
          Icon(
            Icons.star_purple500_rounded,
            color: Colors.deepOrangeAccent,
            size: 13,
          ),
        ],
      );
    }
  }
}
