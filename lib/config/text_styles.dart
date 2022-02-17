import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final standardTextStyle = GoogleFonts.montserrat();

  static final standardPurpleBoldStyle = standardTextStyle.copyWith(
      color: Colors.deepPurple, fontWeight: FontWeight.bold);

  static final standardPurpleStyle =
      standardTextStyle.copyWith(color: Colors.deepPurple);

  static final titleTextStyle =
      standardTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 65);

  static final subtitleTextStyle =
      standardTextStyle.copyWith(color: Colors.grey[700], fontSize: 20);

  static final textButtonStyles =
      standardTextStyle.copyWith(color: Colors.deepPurple);
}
