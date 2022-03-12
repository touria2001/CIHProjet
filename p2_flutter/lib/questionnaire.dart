import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'AppColors.dart';
import 'test.dart';
import 'myApp.dart';
import 'package:p2_flutter/pages/meets/meets_detail.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Questionnaire> {
  late String q2;

  addData(String v, String q) async {
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection("questionnaire");

    usersRef.doc(q).set({q: v});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Text("Questionnaire"),
        ),
        body: Container(
            margin: EdgeInsets.only(top: 20, left: 5, right: 5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 12),
                      child: Text(
                        "s'il vous plait repondez a ces questions:",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: AppColors.iconColor2,
                            shadows: [
                              Shadow(
                                color: AppColors.mainColor,
                                blurRadius: 2.0,
                                offset: Offset(0, 2),
                              )
                            ]),
                      )),
                  Container(
                      padding:
                          EdgeInsets.only(right: 8, bottom: 7, left: 8, top: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textColor, //color of border
                          width: 1, //width of border
                        ),
                        color: Color(0XFFF2FFF9),
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 1.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          // decoration: BoxDecoration(
                          //       border: Border.all(
                          //         color: colors.textColor, //color of border
                          //         width: 1, //width of border
                          //       ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10, left: 5),
                            width: MediaQuery.of(context).size.width,
                            child: Text("Quel type de diabète avez vous ?",
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 15,
                                  color: AppColors.mainBlacktColor,
                                  fontFamily: 'Lobster',
                                  fontStyle: FontStyle.italic,
                                )),
                          ),
                          Container(
                              padding: EdgeInsets.only(right: 8, left: 15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.textColor, //color of border
                                  width: 1, //width of border
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "ecrire ici",
                                ),
                                onChanged: (value) {
                                  addData(value, "question5");
                                },
                              )),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 7, bottom: 7),
                      padding:
                          EdgeInsets.only(right: 8, bottom: 7, left: 8, top: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textColor, //color of border
                          width: 1, //width of border
                        ),
                        color: Color(0XFFF2FFF9),
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 1.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10, left: 5),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                                "A quel âge, environ, un médecin vous a-t-il dit pour la première fois que vous aviez un diabète ?",
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 15,
                                  color: AppColors.mainBlacktColor,
                                  fontFamily: 'Lobster',
                                  fontStyle: FontStyle.italic,
                                )),
                          ),
                          Container(
                              padding: EdgeInsets.only(right: 8, left: 15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.textColor, //color of border
                                  width: 1, //width of border
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  addData(value, "question6");
                                },
                              )),
                        ],
                      )),
                  Container(
                      padding:
                          EdgeInsets.only(right: 8, bottom: 7, left: 8, top: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textColor, //color of border
                          width: 1, //width of border
                        ),
                        color: Color(0XFFF2FFF9),
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 1.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10, left: 5),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                                "Votre diabète a-t-il eu un impact sur votre parcours scolaire",
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 15,
                                  color: AppColors.mainBlacktColor,
                                  fontFamily: 'Lobster',
                                  fontStyle: FontStyle.italic,
                                )),
                          ),
                          Container(
                              padding: EdgeInsets.only(right: 8, left: 15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.textColor, //color of border
                                  width: 1, //width of border
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  addData(value, "question7");
                                },
                              )),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 7, bottom: 7),
                      padding:
                          EdgeInsets.only(right: 8, bottom: 7, left: 8, top: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textColor, //color of border
                          width: 1, //width of border
                        ),
                        color: Color(0XFFF2FFF9),
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 1.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10, left: 5),
                            width: MediaQuery.of(context).size.width,
                            child: Text("Quel est votre poids actuel",
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 15,
                                  color: AppColors.mainBlacktColor,
                                  fontFamily: 'Lobster',
                                  fontStyle: FontStyle.italic,
                                )),
                          ),
                          Container(
                              padding: EdgeInsets.only(right: 8, left: 15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.textColor, //color of border
                                  width: 1, //width of border
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  addData(value, "question8");
                                },
                              )),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.all(17),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            // style: flatButtonStyle,
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Test();
                              }));
                            },
                            child: Image.asset(
                              "assets/image/retour.png",
                              width: 50,
                            ),
                          ),
                          TextButton(
                            // style: flatButtonStyle,
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return MyAppp();
                              }));
                            },
                            child: Image.asset(
                              "assets/image/suivant.png",
                              width: 50,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            )));
  }
}
