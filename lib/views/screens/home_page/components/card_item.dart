import 'package:flutter/material.dart';
import 'package:food/views/styls/fonts.dart';
import 'package:food/views/styls/padding.dart';

class CardItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Function onTap;
  CardItem({this.title, this.imageUrl, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: kDPadding),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 110,
          height: 100,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(vertical: kDPadding),
          decoration: BoxDecoration(color: Colors.tealAccent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: kMonserat),
              ),
              Image.asset(
                imageUrl,
                height: 45,
                width: 45,
              )
            ],
          ),
        ),
      ),
    );
  }
}
