import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:p2_flutter/utils/colors.dart';
import 'package:p2_flutter/utils/dimensions.dart';
import 'package:p2_flutter/widgets/app_column.dart';
import 'package:p2_flutter/widgets/app_icon.dart';
import 'package:p2_flutter/widgets/big_text.dart';
import 'package:p2_flutter/widgets/exandable_text_widget.dart';

import 'main_page.dart';


class MeetsDetail extends StatelessWidget {
  const MeetsDetail({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
              right: 0,
              child: Container(
                  width: double.maxFinite,
                height: Dimensions.meetsDetailImgSize,
                decoration: BoxDecoration(

                  image: DecorationImage(
                      fit:BoxFit.cover,
                    image :AssetImage(
                      "assets/image/img1.jpg"
                    )
                  )
                ),

          ),
          ),
          //icon widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
              right: Dimensions.width20,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Get.to(()=>MainPage());
                        },
                        child: AppIcon(icon: Icons.arrow_back_ios)),
                    AppIcon(icon: Icons.star_border_purple500_outlined,)
                  ],
              ),

          ),
          //introduction
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.meetsDetailImgSize-20,
              child: Container(

                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                     topRight: Radius.circular( Dimensions.radius20),
                    topLeft: Radius.circular( Dimensions.radius20),

                  ),
                  color:Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "meeting sujet",),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Détails"),
                    // expandable text widget
                    Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(text: "Le premier journal imprimé connu, un hebdomadaire de quatre pages intitulé « Relation aller Fürnemmen und gedenckwürdigen Historien (« Communication de toutes histoires importantes et mémorables », parfois appelé Die Straßburger Relation), est lancé à Strasbourg en 1605 par Johann Carolus1. Le Post och Inrikes Tidningar, ou POIT, qui se traduit par « Bulletins d'information nationale », est un journal suédois fondé en 1645 par la reine Christine de Suède et est le plus vieux journal encore existant en 2006. Le journal faisait référence en Suède à la fin du xviie siècle et au xviiie siècle. En janvier 2007, la version papier disparait au profit d'une seule version électronique. La dernière édition papier est datée du 29 décembre 2006. ")),
                    ),
                  ],
                ),
              )),

        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20*2),
              topRight: Radius.circular(Dimensions.radius20*2),
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            GestureDetector(
              // on a besoin des conditions sur ce button!!!
              onTap: ()
              {
                Get.snackbar("Intéressé(e)!", "Une notification sera vous envoyez dès le début de la réunion !");

              },
              child: GestureDetector(
                onTap: (){

                },
                child: Container(

                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),

                  child: BigText(text: "intéressé(e)",color: Colors.white,size: 15,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
