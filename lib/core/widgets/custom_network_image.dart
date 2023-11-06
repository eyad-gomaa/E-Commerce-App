
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({Key? key, required this.imgUrl}) : super(key: key);
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imgUrl,
      fit: BoxFit.cover,
      errorWidget:(context, url, error) => const Icon(Icons.error) ,

    );
    // return Image.network(imgUrl,
    //     fit: BoxFit.cover,
    //     errorBuilder: (context, error, stackTrace) {
    //       return const Icon(Icons.error);
    //     });
  }
}
