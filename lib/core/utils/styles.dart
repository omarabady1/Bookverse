import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'assets.dart';

abstract class Styles {
  static const titleMedium = TextStyle(
    fontFamily: AssetsData.montserrat,
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static final bookTitle =  GoogleFonts.sofiaSans(
    fontSize: 24, fontWeight: FontWeight.w500
  );
  static final bookTitleSmall =  GoogleFonts.sofiaSans(
    fontSize: 18, fontWeight: FontWeight.w500
  );
  static const titleSmall = TextStyle(
    fontFamily: AssetsData.montserrat,
    color: Colors.white,
    fontSize: 14,
  );


}
