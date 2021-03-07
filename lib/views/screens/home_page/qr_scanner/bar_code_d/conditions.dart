import 'package:flutter/material.dart';
import 'package:food/views/screens/home_page/qr_scanner/exports.dart';

class BarCodeTypeConditionBody extends StatelessWidget {
  final String type;
  final Barcode barcode;
  BarCodeTypeConditionBody({this.barcode, this.type});
  @override
  Widget build(BuildContext context) {
    if (type == 'email') {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: kDPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SelectableText('Email Adress: ${barcode.email.address}'),
            SizedBox(
              height: 10,
            ),
            SelectableText('Subject: ${barcode.email.subject}'),
            SizedBox(
              height: 10,
            ),
            SelectableText(barcode.email.body)
          ],
        ),
      );
    } else if (type == 'wifi') {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: kDPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SelectableText('WiFi SSID: ${barcode.wifi.ssid}'),
            SizedBox(
              height: 10,
            ),
            SelectableText('WiFi password: ${barcode.wifi.password}')
          ],
        ),
      );
    } else if (type == 'mobile number') {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: kDPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SelectableText('Phone Number: ${barcode.phone.number}')
          ],
        ),
      );
    } else if (type == 'text') {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: kDPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[SelectableText(barcode.displayValue)],
        ),
      );
    } else if (type == 'url') {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: kDPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SelectableText('Title: ${barcode.url.title}'),
            SizedBox(
              height: 10,
            ),
            SelectableText('url: ${barcode.url.url}'),
          ],
        ),
      );
    } else if (type == 'contactInfo') {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: kDPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SelectableText(barcode.contactInfo.phones[0].number)
          ],
        ),
      );
    } else if (type == 'contactInfo') {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: kDPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SelectableText('Contact name: ${barcode.contactInfo.name}'),
            SizedBox(
              height: 10,
            ),
            SelectableText(
                'Contact Number: ${barcode.contactInfo.phones[0].number}')
          ],
        ),
      );
    } else if (type == 'product') {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: kDPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SelectableText('Product Info: ${barcode.displayValue}')
          ],
        ),
      );
    } else {
      return Center(
        child: SelectableText('No data found'),
      );
    }
  }
}
