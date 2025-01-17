import 'package:flutter/material.dart';
import 'package:food/views/screens/home_page/qr_scanner/exports.dart';

class ShowText extends StatelessWidget {
  final String text;
  ShowText({this.text});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Scanned text'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kDPadding),
        height: double.infinity,
        width: double.infinity,
        child: SelectableText(text),
      ),
    );
  }
}
