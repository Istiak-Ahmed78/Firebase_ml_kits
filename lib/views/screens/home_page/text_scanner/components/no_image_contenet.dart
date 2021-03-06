import 'package:flutter/material.dart';
import 'package:food/views/styls/fonts.dart';

class NoImageCont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: <Widget>[
          Image.asset('images/add_photo.png'),
          SizedBox(
            height: 10,
          ),
          Text(
            'Add an image',
            style: TextStyle(
                fontFamily: kMonserat,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )
        ],
      ),
    );
  }
}
