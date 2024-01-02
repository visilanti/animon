import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../size_config.dart';

const kPrimaryColor = Color.fromRGBO(85, 153, 255, 1);
const kSecondaryColor = Color.fromRGBO(51, 51, 51, 1);
const kThirdColor = Color(0xFFD8D2CB);
const kFourthColor = Color(0xFFEEEEEE);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kColorTeal = Color(0xFF008080);
const kColorTealSlow = Color(0xFF159897);
const kColorTealToSlow = Color(0xFF03c0c1);
const kColorBlue = Color(0xFF3EB2FF);
const kColorGreen = Color(0xFF00FCA6);
const kColorRedSlow = Color(0xFFf55f60);
const kColorYellow = Color(0xFFFFC654);

const mBackgroundColor = Color(0xFFFAFAFA);
const mBlueColor = Color(0xFF2C53B1);
const mGreyColor = Color(0xFFC5C5C5);
const mTitleColor = Color(0xFF23374D);
const mSubtitleColor = Color(0xFF8E8E8E);
const mBorderColor = Color(0xFFE8E8F3);
const mFillColor = Color(0xFFFFFFFF);
const mCardTitleColor = Color(0xFF2E4ECF);
const mCardSubtitleColor = mTitleColor;

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
// const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kUsernameNullError = "Please Enter your username";
const String kKategoryNullError = "Please Enter your category";
const String kJudulBahanyNullError = "Judul bahan ajar tidak boleh kosong";
const String kKeteranganNullError = "Keterangan tidak boleh kosong";
const String kPersentaseBobotNullError = "Please Enter your weight percentage";
const String kInvalidUsernameError = "Please Enter Valid username";
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  fillColor: kPrimaryColor,
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  );
}

// Style for title
var mTitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: mTitleColor, fontSize: 14);

var mTitleStyleColorWhite = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: mFillColor, fontSize: 12);

var mTitleStyle16 = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: mTitleColor, fontSize: 16);

var mTitleStyleColorTeal = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: kColorTeal, fontSize: 10);

var mTitleStyleColorRed = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: kColorRedSlow, fontSize: 10);

var mTitle = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: kFourthColor, fontSize: 14);

var mTitle2 = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: mTitleColor, fontSize: 14);

// Style for title Name
var mTitleStyleNameApps = GoogleFonts.inter(
  fontWeight: FontWeight.bold,
  color: mTitleColor,
  fontSize: 18,
);

var mTitleStyletugas = GoogleFonts.inter(
  fontWeight: FontWeight.bold,
  color: mTitleColor,
  fontSize: 12,
);

// Style for Discount Section
var mMoreDiscountStyle = GoogleFonts.inter(
    fontSize: 12, fontWeight: FontWeight.w700, color: mBlueColor);

// Style for Service Section
var mServiceTitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w500, fontSize: 12, color: mTitleColor);

var mServiceTitleStyleBold = GoogleFonts.inter(
    fontWeight: FontWeight.bold, fontSize: 12, color: mTitleColor);

var mServiceSubtitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w400, fontSize: 10, color: mSubtitleColor);

var mServiceSubtitleStyle12 = GoogleFonts.inter(
    fontWeight: FontWeight.w400, fontSize: 12, color: mSubtitleColor);

var mServiceSeeAll = GoogleFonts.inter(
    fontWeight: FontWeight.w400, fontSize: 12, color: mSubtitleColor);

// Style for Popular Destination Section
var mPopularDestinationTitleStyle = GoogleFonts.inter(
  fontWeight: FontWeight.w700,
  fontSize: 16,
  color: mCardTitleColor,
);
var mPopularDestinationSubtitleStyle = GoogleFonts.inter(
  fontWeight: FontWeight.w500,
  fontSize: 10,
  color: mCardSubtitleColor,
);

// Style for Travlog Section
var mTravlogTitleStyle = GoogleFonts.inter(
    fontSize: 14, fontWeight: FontWeight.w900, color: mFillColor);
var mTravlogContentStyle = GoogleFonts.inter(
    fontSize: 10, fontWeight: FontWeight.w500, color: mTitleColor);
var mTravlogPlaceStyle = GoogleFonts.inter(
    fontSize: 10, fontWeight: FontWeight.w500, color: mBlueColor);

// DateTime _parseDateStr(String inputString) {
//   DateFormat format = DateFormat.yMMMMd();
//   return format.parse(inputString);
// }
//
// parseDateIndo (tanggal) {
//   initializeDateFormatting('id_ID', null);
//   var dateValue = new DateFormat("yyyy-MM-ddTHH:mm:ssZ", "id_ID")
//       .parseUTC(tanggal);
//   String formattedDate =
//   DateFormat("dd MMM yyyy - HH:mm", "id_ID").format(dateValue);
//
//   return formattedDate;
// }
//

// nameDay(data) {
//   initializeDateFormatting('id_ID', null);
//   var nameDate = new DateFormat('EEEE', "id_ID").format(data);
//   // String formattedDate =
//   // DateFormat("EEEE").format(dateValue);
//   return nameDate;
// }
//
// kodeDay(data) {
//   initializeDateFormatting('id_ID', null);
//   var nameDate = new DateFormat('EEEE', "id_ID").format(data);
//   var kodeDate;
//   if(nameDate == 'Senin') {
//     kodeDate = 1;
//   }else if(nameDate == 'Selasa') {
//     kodeDate = 2;
//   }else if(nameDate == 'rabu') {
//     kodeDate = 3;
//   }else if(nameDate == 'Kamis') {
//     kodeDate = 4;
//   }else if(nameDate == 'Jumat') {
//     kodeDate = 5;
//   }else if(nameDate == 'Sabtu') {
//     kodeDate = 6;
//   }
//
//   return kodeDate;
// }

//
// parseDateIndoFullNameMount (tanggal) {
//   initializeDateFormatting('id_ID', null);
//   print(tanggal);
//   var dateValue = DateFormat("yyyy-MM-ddTHH:mm:ssZ", "id_ID")
//       .parseUTC(tanggal);
//   print(dateValue);
//   String formattedDate =
//   DateFormat("dd MMMM yyyy - HH:mm", "id_ID").format(dateValue);
//
//   return formattedDate;
// }
//
// parseDate (tanggal) {
//   initializeDateFormatting('id_ID', null);
//   var dateValue = new DateFormat("yyyy-MMMM-ddTHH:mm:ssZ", "id_ID")
//       .parseUTC(tanggal);
//   String formattedDate =
//   DateFormat("dd-mm-yyyy HH:mm", "id_ID").format(dateValue);
//
//   return formattedDate;
// }

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}

// var perseDate = (){
//   var today = new DateTime.now();
//   var formatedTanggal = new DateFormat.MMMM().format(today);
//   return formatedTanggal;
// };

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
