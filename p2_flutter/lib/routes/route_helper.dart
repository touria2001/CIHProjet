import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:p2_flutter/pages/home/main_page.dart';

import '../pages/home/informations.dart';
import '../pages/home/meets_detail.dart';

class RouteHelper{
  static const String initial="/";
  static const String meet="/meets-detail";
  static const String information="/informations";

  static String getInitial()=> '$initial';
  static String getMeetsDetail()=> '$meet';
  //static String getInformations()=> '$information';

  static List<GetPage> routes=[
    GetPage(name: initial,page: ()=>MainPage()),
    GetPage(name: meet,page: (){
      return MeetsDetail();

  },
      transition: Transition.fadeIn
  ),
   // GetPage(name: information,page: (){ return Informations();},
       // transition: Transition.fadeIn
    //),
   // GetPage(name: information,page: ()=>Informations()),
  ];
}