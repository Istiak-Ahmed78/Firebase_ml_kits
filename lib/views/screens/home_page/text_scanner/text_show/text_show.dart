import 'package:flutter/material.dart';

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
        height: double.infinity,
        width: double.infinity,
        child: SelectableText(text),
      ),
    );
  }
}
