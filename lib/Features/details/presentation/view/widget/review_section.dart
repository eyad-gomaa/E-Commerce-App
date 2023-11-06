import 'package:e_commerce1/Features/details/presentation/view/widget/review_card.dart';
import 'package:flutter/material.dart';
import '../../../../../core/resources/style.dart';
import '../../../../home/data/model/Reviews.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({Key? key, required this.review}) : super(key: key);
  final Reviews review;
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        //************* Reviews title *************
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Reviews",style: StyleManager.headLine3,),
            TextButton(onPressed: (){}, child: Text("View All",style: StyleManager.subtitle,))
          ],
        ),
        //*****************************************
        //************* Reviews card *************
         ReviewCard(review: review)
        //****************************************
      ],
    );
  }
}
