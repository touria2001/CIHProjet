import 'package:flutter/material.dart';
import 'package:p2_flutter/utils/colors.dart';
import 'package:p2_flutter/utils/dimensions.dart';
import 'package:p2_flutter/widgets/small_text.dart';

import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font26,),
        SizedBox(height:Dimensions.height5,
        ),
        Row(
          children: [
            Wrap (
              children: List.generate(1, (index) {
                return Icon(Icons.video_call_rounded, color:AppColors.mainColor , size:22, );}),

            ),
            SizedBox(width: 10,),
            SmallText(text: "lien vers le meet"),
          ],
        ),
        SizedBox(height:Dimensions.height5
        ),
        Row(

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            IconAndTextWidget(icon: Icons.date_range,
                text: "Date:jj/mm/aaaa",
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(icon: Icons.access_time_sharp,
                text: "heure:21h30min",
                iconColor: AppColors.iconColor2),

          ], ),


      ],
    );
  }
}
