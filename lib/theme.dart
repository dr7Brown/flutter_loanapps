import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//const kPrimaryColor = Color.fromARGB(182, 2, 1, 33);
const kPrimaryColor = Color.fromARGB(255, 2, 1, 33);
const kSecondaryColor = Color.fromARGB(255, 139, 149, 165);
const kDarkGreyColor = Color(0xFFA8A8A8);
const kWhiteColor = Color(0xFFFFFFFF);
const Color kAmbeziColor = Color(0xFF5B5B5B);
const kBlackColor = Color(0xFF272726);
const kTextFieldColor = Color(0xFF979797);
const kcolormix = Color.fromARGB(250, 127, 187, 227);
const kOffWhitcolor = Color.fromARGB(214, 255, 255, 255);
const kOffWhitecolor2 = Color.fromARGB(255, 239, 233, 217);
//  const primaryColor = Color(0xff2F8D46),
const splashColor = Colors.transparent;
const highlightColor = Colors.transparent;
const hoverColor = Colors.transparent;
const kGreenColor = Color.fromARGB(219, 41, 133, 5);
const kAmberColor = Color.fromARGB(219, 223, 40, 40);
const kAmberTransColor = Color.fromARGB(113, 208, 17, 62);
const kPurpleDeepColor = Color.fromARGB(255, 124, 77, 255);

//Paddings
const ksmallPadding = EdgeInsets.symmetric(horizontal: 20);
const kDefaultPadding = EdgeInsets.symmetric(horizontal: 30, vertical: 30);
const kLargePadding = EdgeInsets.symmetric(horizontal: 40);
const kxLargePadding = EdgeInsets.symmetric(horizontal: 50);

TextStyle titleText = const TextStyle(
    color: kPrimaryColor, fontSize: 32, fontWeight: FontWeight.w700);
TextStyle subTitle = const TextStyle(
    color: kSecondaryColor, fontSize: 18, fontWeight: FontWeight.w500);
TextStyle textButton = const TextStyle(
  color: kPrimaryColor,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);
TextStyle listViewText = const TextStyle(
    color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.w700);

//

TextStyle kLoginTitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.060,
      fontWeight: FontWeight.bold,
    );

TextStyle kLoginSubtitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.030,
    );

TextStyle kLoginTermsAndPrivacyStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: 15, color: Colors.grey, height: 1.5);

TextStyle kHaveAnAccountStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: size.height * 0.022, color: Colors.black);

TextStyle kLoginOrSignUpTextStyle(
  Size size,
) =>
    GoogleFonts.ubuntu(
      fontSize: size.height * 0.022,
      fontWeight: FontWeight.w500,
      color: Colors.deepPurpleAccent,
    );

TextStyle kTextFormFieldStyle() => const TextStyle(color: Colors.black);

//Font sizes
TextStyle kxSmallFontStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.010,
      fontWeight: FontWeight.bold,
    );
TextStyle kSmallFontStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.020,
      fontWeight: FontWeight.bold,
    );
TextStyle kNormalFontStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.040,
      fontWeight: FontWeight.bold,
    );
TextStyle kDefualtFontStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.040,
      fontWeight: FontWeight.bold,
    );
TextStyle kLargeFontStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.060,
      fontWeight: FontWeight.bold,
    );
TextStyle kxLargeFontStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.080,
      fontWeight: FontWeight.bold,
    );
