import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'questionnaire.dart';
import 'AppColors.dart';

class Test extends StatefulWidget {
  final String phone;
  const Test(this.phone);
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  late String q2;

  String question1 ="";
  String question2 ="";
  String question3 ="";
  String question4 ="";

  addData() async {
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection("questionnaire");

    usersRef.doc("1234").set({"question1":question1,
    "question2":question2,
    "question3":question3,
    "question4":question4,
    });
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
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10, left: 5),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                                "maliak rerre gfgggf hhfhf maliak rerre gfgggf hhfhf maliak rerre gfgggf hhfhffhd",
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
                                  // addData(value, "question1");
                                  question1 = value;
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
                                "maliak rerre gfgggf hhfhf maliak rerre gfgggf hhfhf maliak rerre gfgggf hhfhffhd",
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
                                  // addData(value, "question2");
                                  question2 = value;
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
                                "maliak rerre gfgggf hhfhf maliak rerre gfgggf hhfhf maliak rerre gfgggf hhfhffhd",
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
                                  // addData(value, "question3");
                                  question3 =value;
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
                                "maliak rerre gfgggf hhfhf maliak rerre gfgggf hhfhf maliak rerre gfgggf hhfhffhd",
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
                                  // addData(value, "question4");
                                  question4 = value;
                                },
                              )),
                        ],
                      )),
                  Container(
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              addData();
                              Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return Questionnaire(widget.phone);
      }
      )
      );
                            },
                            child: Image.asset(
                              "assets/image/suivant.png",
                              width: 50,
                            ),
                          ))),
                ],
              ),
            )));
  }
}
