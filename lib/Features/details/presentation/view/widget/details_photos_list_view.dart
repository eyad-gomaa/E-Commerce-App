import 'package:e_commerce1/Features/details/presentation/view/widget/details_photos.dart';
import 'package:e_commerce1/core/resources/app_size.dart';
import 'package:flutter/material.dart';

class DetailsPhotosListView extends StatelessWidget {
  const DetailsPhotosListView({Key? key,required this.imagesList}) : super(key: key);
  final List<String> imagesList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.s15),
      child: SizedBox(
        height: 77,
        width: double.infinity,
        child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 9,),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: imagesList.length,
            itemBuilder: (context, index) =>  DetailsPhotos(imageUrl: imagesList[index])
        ),
      ),
    );
  }
}
