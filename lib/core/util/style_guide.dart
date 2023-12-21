import 'package:flutter/material.dart';

Color newBlue = Color(0XFF0311EB);
Color primaryColor = newBlue;
//Color primaryColor = bluecool; //deepblue;
const primaryLight = const Color(0xFFFF9F59);
const primaryDark = const Color(0xFFFF9F59);

Color secondaryColor = Colors.green;
const secondaryLight = const Color(0xFFFF9F59);
const secondaryDark = const Color(0xFFFF9F59);

const Color gradientStart = const Color(0xFFfbab66);
const Color gradientEnd = const Color(0xFFf7418c);

const Color primaryBackground = notWhite;
LinearGradient primaryGradient = blueGradient;

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

///>>>>>>>>>>>>>>>>>>>>>>>>  COLORS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
const Color glowPurple = Color(0xFF882DEB);
const Color notWhite = Color(0xFFEDF0F2);
const Color nearlyWhite = Color(0xFFFEFEFE);
const Color white = Color(0xFFFFFFFF);
const Color nearlyBlack = Color(0xFF213333);
const Color grey = Color(0xFF3A5160);
const Color dark_grey = Color(0xFF313A44);
const Color darkText = Color(0xFF253840);
const Color darkerText = Color(0xFF17262A);
const Color lightText = Color(0xFF4A6572);
const Color deactivatedText = Color(0xFF767676);
const Color dismissibleBackground = Color(0xFF364A54);
const Color chipBackground = Color(0xFFEEF1F3);
const Color spacer = Color(0xFFF2F2F2);
const Color bluecool = const Color(0xFF3e64ff);
const Color deepblue = const Color(0xFF033fff);
const Color lightblue = const Color(0xFF2f4bff);
const Color fbBlue = const Color(0xFF4267B2);

/// >>>>>>>>>>>>>>>>>>>>>>>>>>>> COLOR GRADIENT  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

var bluePinkGradient = new LinearGradient(
    colors: [const Color(0xFFCC0099), const Color(0xFF6600FF)],
    tileMode: TileMode.clamp,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0]);

final blueGradient = const LinearGradient(
  colors: const [deepblue, bluecool],
  stops: const <double>[0.5, 0.7],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final purpleGraient = const LinearGradient(
    colors: const <Color>[const Color(0xFF882DEB), const Color(0xFF9A4DFF)],
    stops: const <double>[0.5, 0.7],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

final redGradient = const LinearGradient(colors: const <Color>[
  const Color(0xFFBA110E),
  const Color(0xFFCF3110),
], stops: const <double>[
  0.6,
  0.8
], begin: Alignment.bottomRight, end: Alignment.topLeft);

final greenGradient = const LinearGradient(colors: const <Color>[
  Colors.green,

  /// long
  Colors.green,

  /// short
], stops: const <double>[
  0.6,
  0.8
], begin: Alignment.bottomRight, end: Alignment.topLeft);

var disabledSilverGradient = new LinearGradient(
    colors: [const Color(0xFFF6F2F2), const Color(0xFFD9D9D9)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);
var whiteGradient = new LinearGradient(
    colors: [const Color(0xFFfdfbfb), const Color(0xFFebedee)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);
var creamGradient = new LinearGradient(
    colors: [const Color(0xFFF6F0EA), const Color(0xFFF1DFD1)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);
var test = LinearGradient(
  colors: [],
  begin: Alignment.topLeft,
  end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
  // colors: [const Color(0xFFFFFFEE), const Color(0xFF999999)], // whitish to gray
  //tileMode: TileMode.repeated, // repeats the gradient over the canvas
);

/// >>>>>>>>>>>>>>>>>>>>> TEXTSTYLE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
var primaryFont = "Quicksand";

const TextStyle display1 = TextStyle(
  // h4 -> display1
  fontFamily: 'Quicksand',
  fontWeight: FontWeight.bold,
  fontSize: 24,
  letterSpacing: 0.4,
  height: 0.9,
  color: darkerText,
);

const TextStyle display2 = TextStyle(
  // h4 -> display1
  fontFamily: 'Quicksand',
  fontSize: 20,
  letterSpacing: 0.4,
  height: 0.9,
  color: Colors.black,
);

const TextStyle display3 = TextStyle(
  // h4 -> display1
  fontFamily: 'Quicksand',
  fontSize: 18,
  letterSpacing: 0.4,
  height: 0.9,
  color: Colors.black,
);

const TextStyle btnTextBlack = TextStyle(
  // subtitle2 -> subtitle
  fontFamily: 'Quicksand',
  fontWeight: FontWeight.w400,
  fontSize: 18,
  letterSpacing: -0.04,
  color: Colors.black,
);

const TextStyle btnTextWhite = TextStyle(
  // subtitle2 -> subtitle
  fontWeight: FontWeight.w400,
  fontFamily: 'Quicksand',
  fontSize: 18,
  letterSpacing: -0.04,
  color: Colors.white,
);

const TextStyle title = TextStyle(
    color: Colors.white,
    fontFamily: 'Quicksand',
    fontSize: 32,
    fontWeight: FontWeight.bold);

const TextStyle headline = TextStyle(
  // h5 -> headline
  fontFamily: 'Quicksand',
  fontWeight: FontWeight.bold,
  fontSize: 24,
  letterSpacing: 0.27,
  color: darkerText,
);

const TextStyle subtitle = TextStyle(
  fontFamily: 'Quicksand',
  fontWeight: FontWeight.w400,
  fontSize: 18,
  letterSpacing: -0.04,
  color: darkText,
);

const TextStyle body1 = TextStyle(
  // body2 -> body1
  fontFamily: 'Quicksand',
  fontWeight: FontWeight.w400,
  fontSize: 16,
  letterSpacing: -0.05,
  color: darkText,
);

const TextStyle body2 = TextStyle(
  // body1 -> body2
  fontFamily: 'Quicksand',
  fontWeight: FontWeight.w400,
  fontSize: 14,
  letterSpacing: 0.2,
  color: darkText,
);

TextStyle descriptionWhite =
    TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Quicksand');

TextStyle description =
    TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Quicksand');

const List<MaterialColor> myPrimaries = <MaterialColor>[
  Colors.red,
  Colors.pink,
  Colors.deepPurple,
  Colors.purple,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  // Colors.lime,
  //Colors.yellow,
  // Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.blueGrey,
];
