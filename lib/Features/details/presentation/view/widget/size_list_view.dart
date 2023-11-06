import 'package:flutter/cupertino.dart';

import '../../../../../core/resources/app_size.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style.dart';

class SizeListView extends StatelessWidget {
  const SizeListView({Key? key, required this.size}) : super(key: key);
final List<String> size;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Size Title
        Text("Size",style: StyleManager.headLine3,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: PaddingSize.s10),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorManager.darkWhite
                  ),
                  child: Center(child: Text(size[index],style: StyleManager.headLine4,)),
                ),
                separatorBuilder:(context, index)=> const SizedBox(width:9),
                itemCount: size.length
            ),
          ),
        ),
      ],
    );
  }
}
