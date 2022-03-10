import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:p2_flutter/utils/colors.dart';
import 'package:p2_flutter/utils/dimensions.dart';
import 'package:p2_flutter/widgets/app_icon.dart';
import 'package:p2_flutter/widgets/big_text.dart';
import 'package:p2_flutter/widgets/exandable_text_widget.dart';

import '../../routes/route_helper.dart';
import '../constants.dart';

class Informations extends StatelessWidget {
  final Information info;
  int _favoriteBtn=0;
  Informations(this.info);
  //int get favoriteBtn=>_favoriteBtn;
 // const Informations({Key? key,required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //pour eleminer le button de routeur par defaut
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                GestureDetector(
                  onTap:()
                  {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                    child: AppIcon(icon: Icons.clear)),
                Container(

                  child: Icon(
                    Icons.favorite,
                    size: 40.0
                    //color:AppColors.mainColor,

                  ),
                ),

              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                //margin: EdgeInsets.only(left: Dimensions.width20,right:Dimensions.width20),
               child: Center(child: BigText(text: info.name,size: Dimensions.font26,),),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5,bottom:10),
                decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    )
                ),

              ),
            ),
            pinned:true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                info.img,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(

            child: Column(
              children: [
                Container(
                  child:ExpandableTextWidget(text:info.descreption ) ,
                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                )
              ],
            )
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Container(
            padding: EdgeInsets.only(
           left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              bottom: Dimensions.height10,
             top: Dimensions.height10,
            ),

          ),
          Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(

                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,

                  ),
                  child: GestureDetector(

                    // je suis tramper et ajouter Gestu(c'est un Container a l'origine)... et on Tap
                    onTap: (){

                    },
                    child: Icon(
                      Icons.favorite,
                      size: 30,
                      color:AppColors.mainColor,

                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),

                  child: BigText(text: "voir la vidéo",color: Colors.white,size: 15,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
