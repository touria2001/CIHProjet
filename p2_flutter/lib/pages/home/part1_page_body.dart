import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:p2_flutter/utils/colors.dart';
import 'package:p2_flutter/utils/dimensions.dart';
import 'package:p2_flutter/widgets/app_column.dart';
import 'package:p2_flutter/widgets/big_text.dart';
import 'package:p2_flutter/widgets/icon_and_text_widget.dart';
import 'package:p2_flutter/widgets/small_text.dart';

import '../../routes/route_helper.dart';
import '../constants.dart';
import 'informations.dart';
import 'article.dart';


class Part1PageBody extends StatefulWidget {
  const Part1PageBody({Key? key}) : super(key: key);
  @override
  _Part1PageBodyState createState() => _Part1PageBodyState();
}

class _Part1PageBodyState extends State<Part1PageBody> {
  PageController pageController = PageController(viewportFraction: 0.90);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
 

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // print(" Current Value is"+ _currPageValue.toString());
      });
    });
  }

  @override
  Future<void> dispose() async {
    pageController.dispose();
  }
  /******************************************halima has star */
FirebaseFirestore Firestore = FirebaseFirestore.instance;
final articlesRef = FirebaseFirestore.instance.collection('articles').withConverter<Article>(
      fromFirestore: (snapshot, _) => Article.fromJson(snapshot.data()!),
      toFirestore: (article, _) => article.toJson(),
    );
    /******************************************halima has star */
  @override
  Widget build(BuildContext context) {
    /******************************************halima has stora */
    return  StreamBuilder<QuerySnapshot<Article>>(
        stream: articlesRef.snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot<Article>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
         
         
        

          
          else{

final data = snapshot.requireData;
          
/******************************************halima has star */
   return Column(
      children: [
        //slider section
        GestureDetector(
          onTap: () {
            Get.toNamed(RouteHelper.getMeetsDetail());
            // Get.to(()=>MeetsDetail());
          },
          child: Container(
            // color: Color(0xFF9294cc),
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, position) {
                  return _buildPageItem(position);
                }),
          ),
        ),
            
        SizedBox(
          height:Dimensions.height2,
        /*  500,
          child: ElevatedButton(onPressed: (){
            print(snapshot.data!.docs.length);
snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            
              print(data['date']);
              
            
          }).toList();
            print("fdddddddddddddddddddddddddddd");
            
          }, child: Text("djjdf")),*/
        ),

        //dots no9aats hhh
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),

        //popular text
        SizedBox(
          height: Dimensions.height2,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "page home"),
              SizedBox(
                width: Dimensions.width5,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width5,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "Les catégories",
                  color: Colors.black26,
                ),
              ),
            ],
          ),
        ),
        //list of images and informations about diabete

        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:// INFORMATIONS_DATA_List.length,
           // snapshot.data!.docs.length,
           /******************************************halima has star */
           data.docs.length,
           /******************************************halima has star */
            itemBuilder: (context, index) {
              Information information = INFORMATIONS_DATA_List[index];
              return GestureDetector(
               onTap: () {
                 print("fdddddddddddddddddd");
                 print(data.docs[index].get('titre'));
                 /******************************************halima had star */
                 Article article= Article(titre:data.docs[index].get('titre'),date:data.docs[index].get('date'),text:data.docs[index].get('text'),image:data.docs[index].get('image'));
                 /******************************************halima has star */
               
                 print(article.date);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Informations(article)));
                  //Get.toNamed(RouteHelper.getInformations());
                  //Get.to(()=>Informations());
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height10),
                  child: Row(
                    children: [
                      //image section
                      Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(data.docs[index].get('image'))
                            //  NetworkImage(data.docs[index].reference as String)
                              ),
                        ),
                      ),
                      //text Container
                      Expanded(
                        child: Container(
                          height: Dimensions.listTextContSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: //information.name
                                data.docs[index].get('titre')),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                SmallText(text: "voir plus d'informations"),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconAndTextWidget(
                                        icon: Icons.date_range,
                                        text: //information.date,
                                        //data.docs[index].get('date'),
                                        "gfdg",
                                        
                                        iconColor: AppColors.iconColor1),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ],
    );}});
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getMeetsDetail());
            },
            child: Container(
                height: Dimensions.pageViewContainer,
                margin: EdgeInsets.only(
                    left: Dimensions.width10, right: Dimensions.width10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/img1.jpg")))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15, left: 15, bottom: 15),
                child: const AppColumn(
                  text: "meeting sujet",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
