import 'package:flutter/material.dart';
import 'package:food/views/screens/home_page/qr_scanner/qr_scanner.dart';
import 'package:food/views/screens/home_page/text_scanner/textScanner.dart';

class HomeCardItemMode {
  final String title;
  final String imageUrl;
  final Widget navTo;
  HomeCardItemMode({this.imageUrl, this.title, this.navTo});
  static List<HomeCardItemMode> cardList = [
    HomeCardItemMode(
        title: 'Scan Text',
        imageUrl: 'images/t_scanner.png',
        navTo: TextScanner()),
    HomeCardItemMode(
        title: 'Scan QR code',
        imageUrl: 'images/qr_code.png',
        navTo: QRScanner()),
  ];
}
