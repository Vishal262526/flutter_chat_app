import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Colors
const Color kBackgroundColor = Color(0xFFFFFFFF);
const Color kWhite = Colors.white;
const Color kBlack = Colors.black;
const Color kPrimaryColor = Color(0xFFA555EC);
const Color kPrimaryColorMidLight = Color(0xFFD09CFA);
const Color kPrimaryColorVeryLight = Color(0xFFF3CCFF);

// Text Stykes
const TextStyle kInputPlaceholderTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFFD09CFA),
);

const TextStyle kPrimaryHeading1TextStyle =
    TextStyle(fontSize: 30, color: kPrimaryColor, fontWeight: FontWeight.bold);

const TextStyle kPrimaryHeading3TextStyle = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 20, color: kPrimaryColorMidLight);

// image Picker
Future<dynamic> pickImage(ImageSource source) async {
  final ImagePicker _pciker = ImagePicker();

  XFile? imgFile = await _pciker.pickImage(source: source);
  if (imgFile != null) {
    return await imgFile.readAsBytes();
  }
  print("No Image Selected");
}
