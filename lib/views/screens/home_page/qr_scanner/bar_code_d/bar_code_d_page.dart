import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'conditions.dart';

class BarCodeDeatails extends StatelessWidget {
  final String barcodeType;
  final Barcode barcode;
  BarCodeDeatails({this.barcode, this.barcodeType});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode result'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('Barcode type: $barcodeType'),
            SizedBox(
              height: 300,
            ),
            Container(
              width: double.infinity,
              child: BarCodeTypeConditionBody(
                barcode: barcode,
                type: barcodeType,
              ),
            )
          ],
        ),
      ),
    );
  }
}
