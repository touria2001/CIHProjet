import 'dart:ffi';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:p2_flutter/quastionClass.dart';
import 'package:p2_flutter/utils/colors.dart' as color;
import 'package:cloud_firestore/cloud_firestore.dart';

class VoirPlus extends StatefulWidget {
  const VoirPlus({Key? key}) : super(key: key);

  @override
  State<VoirPlus> createState() => _VoirPlusState();
}

class _VoirPlusState extends State<VoirPlus> {
  FirebaseFirestore firestrore = FirebaseFirestore.instance;
  //   QuerySnapshot qn = await firestrore
  //       .collection("questionnaire")
  //       .withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore);
  //   return qn.docs;
  // }

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
              drawer: Drawer(),
              body: Container(
                padding: const EdgeInsets.only(
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
                  ]),
                  ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                          onPressed: () {
                            print(data.docs[index].get('rep1'));
                          },
                          child: Text('tap'));
                    },
                  ),

                  //ajouter ici __________________________________________________________
                ]),
              ),
            );
          }
        });
  }
}
