import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Part1PageBody extends StatefulWidget {
  const Part1PageBody({Key? key}) : super(key: key);

  @override
  _Part1PageBodyState createState() => _Part1PageBodyState();
}

class _Part1PageBodyState extends State<Part1PageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white30,
      height: 320,
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Container(
        height: 220,
        margin: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/img1.jpg"))));
  }
}
