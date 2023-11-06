import 'package:flutter/cupertino.dart';

class DetailsPhotos extends StatelessWidget {
  const DetailsPhotos({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77,
      height: 77,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:  DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(imageUrl))
      ),
    );
  }
}
