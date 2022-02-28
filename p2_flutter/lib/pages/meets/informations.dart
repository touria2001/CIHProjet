import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p2_flutter/utils/colors.dart';
import 'package:p2_flutter/utils/dimensions.dart';
import 'package:p2_flutter/widgets/app_icon.dart';
import 'package:p2_flutter/widgets/big_text.dart';
import 'package:p2_flutter/widgets/exandable_text_widget.dart';

class Informations extends StatelessWidget {
  const Informations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                AppIcon(icon: Icons.clear),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                //margin: EdgeInsets.only(left: Dimensions.width20,right:Dimensions.width20),
               child: Center(child: BigText(text: "Définition",size: Dimensions.font26,),),
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
                "assets/image/img2.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(

            child: Column(
              children: [
                Container(
                  child:ExpandableTextWidget(text:"En France, le premier journal imprimé est La Gazette, créé par Théophraste Renaudot, publiée à Paris entre mai 1631 et le 30 septembre 1915 et qui paraît toujours aujourd'hui sous le nom de Petites Affiches. Avec l'industrialisation de la presse écrite, de grands noms de journaux se sont créés, et le terme a servi à désigner à la fois le support physique de l'information (le journal en papier journal) et la société éditrice : le journal employant des journalistes et des reporters. Les plus anciens quotidiens français encore publiés sont, par ordre d'âge, Le Figaro (1826), Le Progrès (1859), La Dépêche du Midi (1870), La Croix (1880), Ouest-Éclair (1899) puis Ouest France (1944), Les Échos (1904) et L’Humanité "
                      "En France, le premier journal imprimé est La Gazette, créé par Théophraste Renaudot, publiée à Paris entre mai 1631 et le 30 septembre 1915 et qui paraît toujours aujourd'hui sous le nom de Petites Affiches. Avec l'industrialisation de la presse écrite, de grands noms de journaux se sont créés, et le terme a servi à désigner à la fois le support physique de l'information (le journal en papier journal) et la société éditrice : le journal employant des journalistes et des reporters. Les plus anciens quotidiens français encore publiés sont, par ordre d'âge, Le Figaro (1826), Le Progrès (1859), La Dépêche du Midi (1870), La Croix (1880), Ouest-Éclair (1899) puis Ouest France (1944), Les Échos (1904) et L’Humanité"
                      "En France, le premier journal imprimé est La Gazette, créé par Théophraste Renaudot, publiée à Paris entre mai 1631 et le 30 septembre 1915 et qui paraît toujours aujourd'hui sous le nom de Petites Affiches. Avec l'industrialisation de la presse écrite, de grands noms de journaux se sont créés, et le terme a servi à désigner à la fois le support physique de l'information (le journal en papier journal) et la société éditrice : le journal employant des journalistes et des reporters. Les plus anciens quotidiens français encore publiés sont, par ordre d'âge, Le Figaro (1826), Le Progrès (1859), La Dépêche du Midi (1870), La Croix (1880), Ouest-Éclair (1899) puis Ouest France (1944), Les Échos (1904) et L’Humanité "
                      "En France, le premier journal imprimé est La Gazette, créé par Théophraste Renaudot, publiée à Paris entre mai 1631 et le 30 septembre 1915 et qui paraît toujours aujourd'hui sous le nom de Petites Affiches. Avec l'industrialisation de la presse écrite, de grands noms de journaux se sont créés, et le terme a servi à désigner à la fois le support physique de l'information (le journal en papier journal) et la société éditrice : le journal employant des journalistes et des reporters. Les plus anciens quotidiens français encore publiés sont, par ordre d'âge, Le Figaro (1826), Le Progrès (1859), La Dépêche du Midi (1870), La Croix (1880), Ouest-Éclair (1899) puis Ouest France (1944), Les Échos (1904) et L’Humanité"
                  ) ,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimensions.iconSize22,
                    iconColor:Colors.white,
                    backroundColor:AppColors.mainColor,
                    icon: Icons.remove),

                AppIcon(
                  iconSize: Dimensions.iconSize24,
                    iconColor:Colors.white,
                    backroundColor:AppColors.mainColor,
                    icon: Icons.add),

              ],
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
                  child: Icon(
                    Icons.favorite,
                    color:AppColors.mainColor,

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
