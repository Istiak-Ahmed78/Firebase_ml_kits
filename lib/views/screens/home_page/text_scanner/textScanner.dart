import 'package:flutter/material.dart';
import 'exports.dart';

class TextScanner extends StatefulWidget {
  @override
  _TextScannerState createState() => _TextScannerState();
}

class _TextScannerState extends State<TextScanner> {
  File pickedImage;
  final imagePicker = ImagePicker();
  void pickImage(ImageSource pickUpSource) async {
    final pickedFile = await imagePicker.getImage(source: pickUpSource);
    setState(() {
      pickedImage = File(pickedFile.path);
    });
  }

  String scannedText = 'No text available';

  Future<void> scaneText({File imageFile}) async {
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(imageFile);
    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);
    String preccessedtext = visionText.text;
    setState(() {
      scannedText = preccessedtext;
    });
    print(preccessedtext);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: textScannerAppBar(),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 20, left: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            pickedImage != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: 'scan',
                        onPressed: () async {
                          await scaneText(imageFile: pickedImage);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowText(
                                        text: scannedText,
                                      )));
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
                        heroTag: 'weapData',
                        onPressed: () {
                          setState(() {
                            pickedImage = null;
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
                  heroTag: 'picFromCamera',
                  onPressed: () {
                    pickImage(ImageSource.camera);
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
                  heroTag: 'fromGallery',
                  onPressed: () {
                    pickImage(ImageSource.gallery);
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
        child: pickedImage == null ? NoImageCont() : Image.file(pickedImage),
      ),
    );
  }
}
