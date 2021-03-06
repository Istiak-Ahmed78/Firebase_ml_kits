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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
