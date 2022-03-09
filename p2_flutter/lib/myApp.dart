import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p2_flutter/pages/home/main_page.dart';
import 'package:p2_flutter/pages/home/informations.dart';
import 'package:p2_flutter/pages/home/meets_detail.dart';



class MyAppp extends StatelessWidget {
  const MyAppp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home://Informations()
      MainPage() ,
      //MeetsDetail(),
      //commentaire ajouté
      routes:{
        'informations':(context){
          return Informations();
        }
      },
    );
  }
}
