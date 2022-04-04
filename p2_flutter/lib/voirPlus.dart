import 'dart:ffi';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:p2_flutter/quastionClass.dart';
import 'package:p2_flutter/utils/colors.dart' as color;
import 'package:cloud_firestore/cloud_firestore.dart';

class VoirPlus extends StatelessWidget {
  FirebaseFirestore firestrore = FirebaseFirestore.instance;
  final int i;
  VoirPlus(this.i);

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

            return Scaffold(

              appBar: AppBar(
                backgroundColor: color.AppColors.mainColor2,
                elevation: 10,
                shadowColor: color.AppColors.paraColor,
                title: Text(
                  'Réponses de la question #$i',
                  style: TextStyle(color: color.AppColors.mainBlacktColor),
                ),
                leading: IconButton(
                  color: color.AppColors.mainBlacktColor,
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: Container(

              drawer: Drawer(),
              body:
               Container(

                /*padding: const EdgeInsets.only(
                  top: 50,
                  left: 10,
                  right: 20,
                ),
                width: MediaQuery.of(context).size.width,
                height: 230,
                child: Column(children: [
                  Row(children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: color.AppColors.mainBlacktColor,
                    ),
                    Expanded(child: Container()),
                  ]),*/

                child: ListView.builder(
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, right: 20, bottom: 5),
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
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListTile(
                        subtitle: Text(data.docs[index].id),
                        title: Text(
                          data.docs[index].get('question${i + 1}'),
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),

                        /*******hona */
                      ),
                    );
                  },
                ),

                //ajouter ici ____________________
                // ]),

                 child: ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                          onPressed: () {
                            print(data.docs[index].get('question1'));
                          },
                          /*******************hona */
                          child: Text(data.docs[index].get('question1')));
                    },
                  ),

                  //ajouter ici __________________________________________________________
               // ]),

              ),
            );
          }
        });
  }
}

// class VoirPlus extends StatefulWidget {
//   //  const VoirPlus({Key? key}) : super(key: key);
//   final int index;
//   VoirPlus(this.index);

//   @override
//   State<VoirPlus> createState() => _VoirPlusState();
// }

// class _VoirPlusState extends State<VoirPlus> {
//   FirebaseFirestore firestrore = FirebaseFirestore.instance;
//   //   QuerySnapshot qn = await firestrore
//   //       .collection("questionnaire")
//   //       .withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore);
//   //   return qn.docs;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//         stream: firestrore.collection('questionnaire').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text(snapshot.error.toString()));
//           }
//           if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             final data = snapshot.requireData;

//             return Scaffold(
//               appBar: AppBar(
//                 title: Text('Réponse de la question '),
//               ),
//               drawer: Drawer(),
//               body: Container(
//                 /*padding: const EdgeInsets.only(
//                   top: 50,
//                   left: 10,
//                   right: 20,
//                 ),
//                 width: MediaQuery.of(context).size.width,
//                 height: 230,
//                 child: Column(children: [
//                   Row(children: [
//                     Icon(
//                       Icons.arrow_back_ios,
//                       size: 20,
//                       color: color.AppColors.mainBlacktColor,
//                     ),
//                     Expanded(child: Container()),
//                   ]),*/
//                 child: ListView.builder(
//                   itemCount: data.docs.length,
//                   itemBuilder: (context, index) {
//                     return ElevatedButton(
//                         onPressed: () {
//                           print(data.docs[index].get('question1'));
//                         },
//                         /*******hona */
//                         child: Text(data.docs[index].get('question1')));
//                   },
//                 ),

//                 //ajouter ici ____________________
//                 // ]),
//               ),
//             );
//           }
//         });
//   }
// }
