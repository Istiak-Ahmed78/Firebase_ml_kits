import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/models/models.dart';
import 'package:food/views/screens/home_page/components/conponents.dart';
import 'package:food/views/styls/styles.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) => CardItem(
                    title: HomeCardItemMode.cardList[index].title,
                    imageUrl: HomeCardItemMode.cardList[index].imageUrl,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomeCardItemMode.cardList[index].navTo));
                    },
                  ),
                  itemCount: HomeCardItemMode.cardList.length,
                  shrinkWrap: true,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Coded and designed by Istiak Ahmed',
                        style: TextStyle(color: Colors.white60),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
