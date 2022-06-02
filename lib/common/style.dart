import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color korange = const Color(0xffFF5C01);
Color kyellow = const Color(0xffFFB01D);
Color kgrey = const Color(0xff8E8EA9);
Color kblack = const Color(0xff32324D);
Color kwhite = const Color(0xffFFFFFF);
Color bgColor = const Color(0xffF8F8F8);

TextStyle kHeading4 = GoogleFonts.inter(
  fontSize: 30,
  fontWeight: FontWeight.w700,
);

TextStyle kHeading5 = GoogleFonts.inter(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.15,
);

TextStyle kHeading6 = GoogleFonts.inter(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.15,
);

TextStyle kSubtitle = GoogleFonts.inter(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.15,
);

TextStyle kBodyText = GoogleFonts.inter(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

final kColorScheme = ColorScheme(
  primary: korange,
  secondary: kyellow,
  surface: kwhite,
  background: kwhite,
  error: Colors.red,
  onPrimary: kwhite,
  onSecondary: Colors.white,
  onSurface: Colors.black87,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.light,
);
