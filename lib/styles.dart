import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kGrey = Color(0xFF9b9a9a);
  static const Color kPrimary = Color(0xFF03664F);
  static const Color kScaffold = Color(0xFFFFFFFF);
  static const Color kText = Color(0xFF000000);

  static BorderRadius kBorderRadius = BorderRadius.circular(12);

  static const EdgeInsets kPadding = EdgeInsets.all(10);

  static TextStyle kTitle = GoogleFonts.mulish(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Styles.kText,
  );

  static TextStyle kSubtitle = GoogleFonts.poppins(
    fontSize: 16,
    color: Styles.kText,
    fontWeight: FontWeight.w500,
  );

  static TextStyle kSubHeading = GoogleFonts.poppins(
    fontSize: 14,
    height: 1.5,
    color: Styles.kText,
    fontWeight: FontWeight.w500,
  );

  static TextStyle kBody = GoogleFonts.poppins(
    fontSize: 13,
    color: Styles.kText,
  );

  static TextStyle kButton = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Styles.kText,
  );
}
