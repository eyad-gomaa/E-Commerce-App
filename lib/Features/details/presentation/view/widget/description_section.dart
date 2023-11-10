import 'package:flutter/cupertino.dart';

import '../../../../../core/resources/app_size.dart';
import '../../../../../core/resources/style.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({Key? key, required this.description}) : super(key: key);
final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.s10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description",style: StyleManager.headLine3,),
          const SizedBox(height: 10,),
          Text(
            description,
            style: StyleManager.subtitle,
            maxLines: 3,
            overflow:TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
