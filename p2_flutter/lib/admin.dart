import 'dart:io' as File;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:p2_flutter/ajouter.dart';
import 'package:p2_flutter/quastionClass.dart';
import 'package:p2_flutter/utils/dimensions.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:p2_flutter/utils/colors.dart' as color;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:p2_flutter/voirPlus.dart';
import 'package:p2_flutter/searchWidget.dart';

class Admin extends StatefulWidget {
  Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  TextEditingController _textEditingController = TextEditingController();
  FirebaseFirestore firestrore = FirebaseFirestore.instance;

  String? imageUrl;
  String query = '';
  @override
  List<String> questionChercher = [];

  List<String> question1 = [
    "Quel type de diabète avez vous ?",
    "A quel âge, environ, un médecin vous a-t-il dit pour la première fois que vous aviez un diabète ?",
    "Votre diabète a-t-il eu un impact sur votre parcours scolaire",
    "Quel est votre poids actuel",
    "Au cours des 12 derniers mois, votre poids a-t-il varié",
    "Avez-vous des difficultés à marcher 500 mètres, sans aide",
    "Votre diabète a-t-il eu un impact sur votre parcours scolaire",
    "Utilisez-vous un lecteur de glycémie ou un capteur en continu à votre domicile",
    "Pensez-vous que vous avez trop de comprimés à prendre",
  ];
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  Future showToast(String message) async {
    await Fluttertoast.cancel();

    Fluttertoast.showToast(msg: message, fontSize: 18);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestrore.collection('questionnaire').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final data = snapshot.requireData;

            return WillPopScope(
              onWillPop: () async {
                if (isDialOpen.value) {
                  isDialOpen.value = false;
                  return false;
                } else {
                  return true;
                }
              },
              child: Scaffold(

                  //backgroundColor: color.AppColors.backgroundColor,

                  drawer: Drawer(),
                  floatingActionButton: SpeedDial(
                    renderOverlay: false,
                    childrenButtonSize: Size(70, 70),
                    onOpen: () => showToast('Ajouter...'),
                    onClose: () => showToast('Fermer...'),
                    openCloseDial: isDialOpen,
                    closeManually: true,
                    spaceBetweenChildren: 10,
                    spacing: 10,
                    icon: Icons.add,
                    overlayColor: color.AppColors.mainColor3,
                    overlayOpacity: 0.6,
                    backgroundColor: color.AppColors.iconColor4,
                    children: [
                      SpeedDialChild(
                          child: Icon(
                            Icons.photo_camera_front,
                          ),
                          onTap: () {},
                          label: 'wibinaire',
                          labelStyle: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          labelBackgroundColor: color.AppColors.iconColor1,
                          backgroundColor: color.AppColors.iconColor1),
                      SpeedDialChild(
                          child: Icon(Icons.post_add_rounded),
                          onTap: () {
                            Navigator.push(context, PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return Ajouter();
                              },
                            ));
                          },
                          label: 'article',
                          labelBackgroundColor: color.AppColors.iconColor1,
                          labelStyle: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          backgroundColor: color.AppColors.iconColor1),
                      SpeedDialChild(
                          onTap: () {
                            Navigator.push(context, PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return Ajouter();
                              },
                            ));
                            ;
                          },
                          child: Icon(Icons.add_photo_alternate_outlined),
                          label: 'photo',
                          labelBackgroundColor: color.AppColors.iconColor1,
                          labelStyle: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          backgroundColor: color.AppColors.iconColor1),
                    ],
                  ),
                  body: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        color.AppColors.mainColor2,
                        color.AppColors.mainColor1.withOpacity(0.7),
                      ],

                      begin: const FractionalOffset(0.0, 0.4),
                      end: Alignment.topRight,
                    )),
                    child: Column(

                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 70, bottom: 10),
                    
                      child: Column(
                        children: [
                          Text("Réponses du Qestionnaire",
                              style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: color.AppColors.mainBlacktColor)),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 120, left: 5),
                            child: Text(
                              "Accessible que par l'admin ",
                              style:
                                  TextStyle(color: color.AppColors.titleColor),
                            ),
                          ),
                          Container(
                              child: Icon(Icons.search),
                              padding: EdgeInsets.only(right: 230),
                              margin: EdgeInsets.only(top: 20, left: 10),
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                color: color.AppColors.mainColor3,
                                borderRadius: BorderRadius.circular(10),
                              ))
                        ],
                      ),
                    
                    )
                  ]),
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(70),
                      )),
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 50, left: 10, right: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 280,
                          child: Column(children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: color.AppColors.mainBlacktColor,
                                ),
                                Expanded(child: Container()),
                                Text("format pdf"),
                                Icon(
                                  Icons.info_outline,
                                  size: 20,
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 20, right: 70, bottom: 10),
                              child: Column(
                                children: [
                                  Text("Réponses du Qestionnaire",
                                      style: TextStyle(
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color:
                                              color.AppColors.mainBlacktColor)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: 120, left: 5),
                                    child: Text(
                                      "Accessible que par l'admin ",
                                      style: TextStyle(
                                          color: color.AppColors.titleColor),
                                    ),
                                  ),
                                  Container(
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            questionChercher = question1
                                                .where((element) => element
                                                    .toLowerCase()
                                                    .contains(
                                                        value.toLowerCase()))
                                                .toList();
                                          });
                                        },
                                        controller: _textEditingController,
                                        decoration: InputDecoration(
                                            icon: Icon(
                                              Icons.search,
                                            ),
                                            border: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            hintText: 'Chercher une question'),
                                      ),
                                      //padding: EdgeInsets.only(right: 230),
                                      margin:
                                          EdgeInsets.only(top: 20, left: 10),
                                      padding: EdgeInsets.only(left: 10),
                                      width: double.infinity,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: color.AppColors.mainColor3,
                                        borderRadius: BorderRadius.circular(10),
                                      ))
                                ],
                              ),
                            )
                          ]),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(70),
                                )),
                            child: Column(children: [
                              SizedBox(
                                height: 20,
                              ),

                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("Question et Réponse",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  Icon(
                                    Icons.loop,
                                    size: 30,
                                    color: color.AppColors.mainColor2,
                                  )
                                ],
                              ),
                              //list view
                              Expanded(
                                child: _textEditingController.text.isNotEmpty &&
                                        questionChercher.isEmpty
                                    ? Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.search_off,
                                              size: 30,
                                            ),
                                            Text(
                                              "aucun résultat",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            Divider(
                                              indent: 20,
                                              endIndent: 20,
                                              color: color.AppColors.signColor,
                                              thickness: 1,
                                            ),
                                        itemCount: _textEditingController
                                                .text.isNotEmpty
                                            ? questionChercher.length
                                            : question1.length,
                                        itemBuilder: (context, i) {
                                          return Container(
                                            height: 130,
                                            margin: EdgeInsets.only(
                                                left: 20,
                                                top: 5,
                                                right: 20,
                                                bottom: 5),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            VoirPlus(i)));
                                              },
                                              title: Text(
                                                _textEditingController
                                                        .text.isNotEmpty
                                                    ? "${questionChercher[i]}"
                                                    : "${question1[i]}",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              subtitle: Text(
                                                "voir plus",
                                                style: TextStyle(
                                                    color: color
                                                        .AppColors.iconColor2),
                                              ),
                                              leading: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "$i",
                                                    style: TextStyle(
                                                        color: color.AppColors
                                                            .paraColor,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      // BoxDecoration(boxShadow: [
                                                      //   BoxShadow(
                                                      //     color: Colors.grey.withOpacity(0.5),
                                                      //     spreadRadius: 5,
                                                      //     blurRadius: 7,
                                                      //     offset: Offset(0, 3),
                                                      //   ),
                                                      // ]
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Colors.white,
                                                          color.AppColors
                                                              .iconColor1,
                                                          color.AppColors
                                                              .iconColor1,
                                                          Colors.white
                                                        ],
                                                      ))),
                                              trailing: Text(
                                                  "${data.docs.length.toString()}réponses"),
                                            ),
                                          );
                                        }),
                              )
                            ]),
                          ),
                        )
                      ],
                    ),
                  )),
            );
            // Widget buildSearch() => SearchWidget(
            //     text: query,
            //     //onChanged: searchQuestion,
            //     hintText: 'Chercher une question ');
          }
        });
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;

    final _picker = ImagePicker();

    PickedFile image;
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      //Select Image
      image =
          (await _picker.pickImage(source: ImageSource.gallery)) as PickedFile;
      var file = File.File(image.path);
      if (image != null) {
        //Upload to firebase
        var snapshot = await _storage.ref().child('imageNAME').putFile(file);
        var downloadUrl = snapshot.ref.getDownloadURL();
      } else {
        print("Aucun chemin");
      }
    } else {
      print("Accordez les permissions et réusseillez!");
    }
  }

  // methode searchQuestion ***************************
  // void searchQuestion(String query) {final founds = question.where((found){}).toList() }
}
