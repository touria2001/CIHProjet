import 'dart:io' as File;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:p2_flutter/upload.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:p2_flutter/utils/colors.dart' as color;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:p2_flutter/voirPlus.dart';

class Admin extends StatefulWidget {
  Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  String? imageUrl;
  List question = [
    {
      "name": "Quel type de diabète avez vous ?",
      "screen": "voir plus",
      "cpu": "4réponse"
    },
    {
      "name":
          "A quel âge, environ, un médecin vous a-t-il dit pour la première fois que vous aviez un diabète ?",
      "screen": "voir plus",
      "cpu": "9réponse"
    },
    {
      "name": "Votre diabète a-t-il eu un impact sur votre parcours scolaire",
      "screen": "voir plus",
      "cpu": "9 réponse"
    },
    {
      "name": "Quel est votre poids actuel",
      "screen": "voir plus",
      "cpu": "16réponse"
    },
    {
      "name": "Au cours des 12 derniers mois, votre poids a-t-il varié",
      "screen": "voir plus",
      "cpu": "8 réponse"
    },
    {
      "name": "Avez-vous des difficultés à marcher 500 mètres, sans aide",
      "screen": "voir plus",
      "cpu": "9réponse"
    },
    {
      "name": "Votre diabète a-t-il eu un impact sur votre parcours scolaire",
      "screen": "voir plus",
      "cpu": "9 réponse"
    },
    {
      "name":
          "Utilisez-vous un lecteur de glycémie ou un capteur en continu à votre domicile",
      "screen": "19px",
      "cpu": "16réponse"
    },
    {
      "name": "Pensez-vous que vous avez trop de comprimés à prendre",
      "screen": "15px",
      "cpu": "8 réponse"
    },
  ];
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  Future showToast(String message) async {
    await Fluttertoast.cancel();

    Fluttertoast.showToast(msg: message, fontSize: 18);
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Icon(Icons.photo_camera_front),
                  onTap: () {},
                  label: 'wibinaire',
                  backgroundColor: color.AppColors.iconColor1),
              SpeedDialChild(
                  child: Icon(Icons.post_add_rounded),
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Ajouter();
                      },
                    ));
                  },
                  label: 'article',
                  backgroundColor: color.AppColors.iconColor1),
              SpeedDialChild(
                  onTap: () {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Ajouter();
                      },
                    ));
                    ;
                  },
                  child: Icon(Icons.add_photo_alternate_outlined),
                  label: 'photo',
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
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 10,
                    right: 20,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 230,
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
                        SizedBox(
                          width: 20,
                        ),
                        Text("Question et Réponse",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
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
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return Ajouter();
                          },
                        ));
                      },
                      child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                                indent: 20,
                                endIndent: 20,
                                color: color.AppColors.signColor,
                                thickness: 1,
                              ),
                          itemCount: question.length,
                          itemBuilder: (context, i) {
                            return Container(
                              height: 130,
                              margin: EdgeInsets.only(
                                  left: 20, top: 5, right: 20, bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ListTile(
                                title: Text(
                                  "${question[i]['name']}",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text(
                                  "${question[i]['screen']}",
                                  style: TextStyle(
                                      color: color.AppColors.iconColor2),
                                ),
                                leading: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "$i",
                                      style: TextStyle(
                                          color: color.AppColors.paraColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.white,
                                            color.AppColors.iconColor1,
                                            color.AppColors.iconColor1,
                                            Colors.white
                                          ],
                                        ))),
                                trailing: Text("${question[i]['cpu']}"),
                              ),
                            );
                          }),
                    ))
                  ]),
                )),
              ],
            ),
          )),
    );
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
}
