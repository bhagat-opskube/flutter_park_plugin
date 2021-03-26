import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../responsive/my_size.dart';

class AppTheme {
  static bool isDarkMode=false;
  static const Color light_white = Color(0xFFf0f0f0);
  static const Color white = Color(0xFFFFFFFF);
  static  Color background = Color(0xff00B78B);
  static  Color disableColor = Color.fromRGBO(237,237,237,1);
  static  Color lightAppColor = Color(0xFFF2F8F1);
  static  Color buttonColor = Color(0xff00B78B);
  static Color? darkText;
  static Color? darkerText;
  static Color? lightText;
  static MaterialColor myAppColor = const MaterialColor(0xFF00B78B,
      const {
        50 : const Color(0x1100B78B),
        100 : const Color(0x2200B78B),
        200 : const Color(0x3300B78B),
        300 : const Color(0x4400B78B),
        400 : const Color(0x5900B78B),
        500 : const Color(0x5500B78B),
        600 : const Color(0x6600B78B),
        700 : const Color(0x7700B78B),
        800 : const Color(0x8800B78B),
        900 : const Color(0x9900B78B),
      }
        );
  static Color? spacer;
  static Color? appColor;
  static Color selectedColor=Color(0xFFFFE8DF);
  static Color? black_app_color;
  static Color? app_color_black;
  static Color? white_app_color;
  static Color? white_black_color;
  static Color? light_black_white_color;
  static Color transparent = Color(0x00FFFFFF);
  static Color? statusBarColor ;

  static init(bool darkMode)
  {
    isDarkMode=darkMode;
    background=darkMode?myAppColor.shade100:myAppColor.shade100;
    darkText=darkMode?Color(0xFFFFFFFF):Color(0xFF253840);
    darkerText=darkMode?Color(0xFFFFFFFF):Color(0xFF17262A);
    lightText=darkMode?Color(0xFFFFFFFF):Color(0xFF4A6572);
    spacer=darkMode?Color(0xFF202020):Color(0xFF00B78B);
    appColor=darkMode?Color(0xFF00B78B):Color(0xFF00B78B);
    statusBarColor=darkMode?Color(0xFF17262A):Colors.black;
    black_app_color=darkMode?Color(0xFF000000):Color(0xFF00B78B);
    white_app_color=darkMode?Color(0xFFFFFFFF):Color(0xFF00B78B);
    app_color_black=darkMode?Color(0xFF00B78B):Color(0xFF000000);
    white_black_color=darkMode?Color(0xFFFFFFFF):Color(0xFF000000);
    light_black_white_color=darkMode?Color(0xFF202020):Color(0xFFFFFFFF);
  }

//  const LinearGradient mainButton = LinearGradient(colors: [
//    Color.fromRGBO(236, 60, 3, 1),
//    Color.fromRGBO(234, 60, 3, 1),
//    Color.fromRGBO(216, 78, 16, 1),
//  ], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);
//
//  const List<BoxShadow> shadow = [
//    BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
//  ];

  static TextStyle headline1 = TextStyle(
    fontFamily: "Segoe",
    package: "flutter_park_plugin",
    fontWeight: FontWeight.bold,
    color: Colors.black45,
    fontSize: size_18,
    letterSpacing: 0.27,
    height: 0.9,
  );

  static TextStyle headline2 = TextStyle(
    fontFamily: "Segoe",
    package: "flutter_park_plugin",
    fontWeight: FontWeight.w800,
    color: Colors.black45,
    fontSize: size_16,
    letterSpacing: 0.27,
  );

  static TextStyle headline3 = TextStyle(
    fontFamily: "Segoe",
    package: "flutter_park_plugin",
    fontWeight: FontWeight.w500,
    color: Colors.black45,
    fontSize: size_14,
    letterSpacing: 0.27,
  );

  static TextStyle title = TextStyle(
    /// bold text
    fontFamily: "Segoe",
    package: "flutter_park_plugin",
    fontWeight: FontWeight.bold,
    fontSize: size_16,
    letterSpacing: 0.18,
  );
  static TextStyle button_title = TextStyle(
    /// semi bold
    fontFamily: "Segoe",
    package: "flutter_park_plugin",
    fontWeight: FontWeight.w600,
    fontSize: size_18,
    letterSpacing: 0.18,
  );

  static TextStyle subtitle = TextStyle(
    /// SemiBold Text
    fontFamily: "Segoe",
    package: "flutter_park_plugin",
    fontSize: size_14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle body2 = TextStyle(
    fontFamily: "Segoe",
    package: "flutter_park_plugin",
    fontSize: size_14,
    letterSpacing: 0.2,
    fontWeight: FontWeight.w400,
  );

  static TextStyle body1 = TextStyle(
    fontFamily: "Segoe",
    package: "flutter_park_plugin",
    fontSize: size_16,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.05,
  );

  static TextStyle caption = TextStyle(
    /// normal text
    fontFamily: "Segoe",
    package: "flutter_park_plugin",
    fontSize: size_14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.2,
  );
  static TextStyle lable = TextStyle(

      /// Medium Text
      color: Colors.black45,
      fontFamily: "Segoe",
    package: "flutter_park_plugin",
      fontWeight: FontWeight.w500,
      fontSize: size_14);

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
      init(isDarkTheme);
      TextTheme textTheme = TextTheme(
        headline1: headline1,
        headline2: headline2,
        headline3: headline3, /// light text
        subtitle1: title,     /// bold text
        subtitle2: subtitle,  /// semi bold
        bodyText1: body1,
        bodyText2: body2, /// label
        caption: caption,  /// caption
      );

    return ThemeData(
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: myAppColor,
      ),
      // for others(Android, Fuchsia)
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: myAppColor,
        selectionColor: myAppColor,
        selectionHandleColor: myAppColor
      ),
      primarySwatch: myAppColor,
      primaryColor: isDarkTheme ? Colors.black : appColor,

      backgroundColor: isDarkTheme ? Colors.black : Colors.white,

      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xff00B78B),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xff00B78B),

      hintColor: isDarkTheme ? Color(0xff280C0B) : Colors.black,

      highlightColor: isDarkTheme ? Color(0xFFFFFFFF) : Color(0x22F16A36),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff00B78B),
//      iconTheme: IconTheme(data: IconThemeData(), child: null),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0x00FFAC30),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xFF151515) : Color(0x00FFAC30),
      canvasColor: isDarkTheme ? Colors.black : Colors.white,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
      textTheme: textTheme,
    );

  }

}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }


}
