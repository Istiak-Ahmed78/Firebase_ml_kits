import 'package:flutter/material.dart';
import 'exports.dart';

class QRScanner extends StatefulWidget {
  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  File pickedImageQR;
  void navigatToDea(
      {BuildContext context, String barcodeType, Barcode barcod}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BarCodeDeatails(
                  barcodeType: barcodeType,
                  barcode: barcod,
                )));
  }

  Future<void> scanQR({File theGivenFile}) async {
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(theGivenFile);
    final BarcodeDetector barcodeDetector =
        FirebaseVision.instance.barcodeDetector();
    final List<Barcode> barcodes =
        await barcodeDetector.detectInImage(visionImage);
    for (Barcode barcode in barcodes) {
      final BarcodeValueType valueType = barcode.valueType;
      if (valueType == BarcodeValueType.wifi) {
        navigatToDea(barcodeType: 'wifi', barcod: barcode, context: context);
      } else if (valueType == BarcodeValueType.url) {
        navigatToDea(barcodeType: 'url', barcod: barcode, context: context);
      } else if (valueType == BarcodeValueType.text) {
        navigatToDea(barcodeType: 'text', barcod: barcode, context: context);
      } else if (valueType == BarcodeValueType.email) {
        navigatToDea(barcodeType: 'email', barcod: barcode, context: context);
      } else if (valueType == BarcodeValueType.contactInfo) {
        navigatToDea(
            barcodeType: 'contactInfo', barcod: barcode, context: context);
      } else if (valueType == BarcodeValueType.product) {
        navigatToDea(barcodeType: 'product', barcod: barcode, context: context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('QR Code scan'),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 20, left: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            pickedImageQR != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: 'scanQR',
                        onPressed: () async {
                          await scanQR(theGivenFile: pickedImageQR);
                        },
                        child: Icon(
                          Icons.scanner,
                          color: kFloatABChildColor,
                        ),
                      ),
                      SizedBox(
                        height: kSpaceBF,
                      ),
                      FloatingActionButton(
                        heroTag: 'weapDataQR  ',
                        onPressed: () {
                          setState(() {
                            pickedImageQR = null;
                          });
                        },
                        child: Icon(
                          Icons.delete_forever,
                          color: kFloatABChildColor,
                        ),
                      )
                    ],
                  )
                : Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                  ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: 'picFromCameraQR',
                  onPressed: () async {
                    File picke = await pickImage(ImageSource.camera);
                    setState(() {
                      pickedImageQR = picke;
                    });
                  },
                  child: Icon(
                    Icons.add_a_photo,
                    color: kFloatABChildColor,
                  ),
                ),
                SizedBox(
                  height: kSpaceBF,
                ),
                FloatingActionButton(
                  heroTag: 'fromGalleryQR',
                  onPressed: () async {
                    File picked = await pickImage(ImageSource.gallery);
                    setState(() {
                      pickedImageQR = picked;
                    });
                  },
                  child: Icon(
                    Icons.photo,
                    color: kFloatABChildColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child:
            pickedImageQR == null ? NoImageCont() : Image.file(pickedImageQR),
      ),
    );
  }
}
