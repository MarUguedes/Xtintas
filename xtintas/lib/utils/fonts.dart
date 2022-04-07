import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtintas/utils/custom_colors.dart';

abstract class CustomFont {
  static final titleStyle = GoogleFonts.openSans(
      fontWeight: FontWeight.bold,
      fontSize: 36,
      color: CustomColors.defaultFontColor);
  static final subTitleStyle = GoogleFonts.openSans(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: CustomColors.defaultFontColor);
  static final inputTextStyle = GoogleFonts.openSans(
      
      fontSize: 16,
      color: const Color.fromARGB(210, 255, 255, 255));
  static final defaultTextStyle = GoogleFonts.openSans(fontSize: 16,color: CustomColors.defaultFontColor,fontWeight: FontWeight.bold);
}
