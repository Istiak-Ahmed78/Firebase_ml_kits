import 'dart:io';
import 'package:image_picker/image_picker.dart';

final imagePicker = ImagePicker();
Future<File> pickImage(ImageSource pickUpSource) async {
  final pickedFile = await imagePicker.getImage(source: pickUpSource);
  return File(pickedFile.path);
}
