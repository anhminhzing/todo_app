import 'package:flutter/material.dart';
import 'package:flutter_app/theme/themetext.dart';

class DataTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColorBrightness: Brightness.light,
    primaryColor: Color(0xFF2a9df4),
    primaryColorLight: Colors.lightBlue,
    primaryColorDark: Colors.black87,
    accentColor: Colors.orange,
    accentColorBrightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarColor: Colors.white,
    cardColor: Colors.blue,
    dividerColor: Colors.grey,
    shadowColor: Colors.black45,
    applyElevationOverlayColor: true,
    cursorColor: Colors.blue,
    fontFamily: 'cufonfonts',
    buttonTheme: ButtonThemeData(),
    textTheme: ThemeText.themeTextLight,
    accentTextTheme: ThemeText.accentThemeText,
    primaryTextTheme: ThemeText.primaryThemeText,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: Colors.white,
      centerTitle: true,
    ),
    hoverColor: Colors.black45,
    splashColor: Colors.black45,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColorBrightness: Brightness.dark,
    primaryColor: Colors.black,
    primaryColorLight: Colors.lightBlue,
    primaryColorDark: Colors.white,
    accentColor: Colors.orange,
    accentColorBrightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    bottomAppBarColor: Colors.black,
    cardColor: Colors.white,
    dividerColor: Colors.black,
    shadowColor: Colors.black45,
    applyElevationOverlayColor: true,
    cursorColor: Colors.white,
    fontFamily: 'cufonfonts',
    buttonTheme: ButtonThemeData(),
    textTheme: ThemeText.themeTextDark,
    accentTextTheme: ThemeText.accentThemeText,
    primaryTextTheme: ThemeText.primaryThemeText,
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: Colors.white,
    ),
    splashColor: Colors.white54,
    hoverColor: Colors.white54,
  );
}
