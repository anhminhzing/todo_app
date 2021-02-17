import 'package:flutter/material.dart';
import 'package:flutter_app/theme/textstyle.dart';

class ThemeText {
  static TextTheme themeTextLight = TextTheme(
    headline1: StyleText.h1,
    headline2: StyleText.h2,
    bodyText1: StyleText.bodytext1,
    bodyText2: StyleText.bodytext2,
    caption: StyleText.caption,
  ).apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  );

  static TextTheme themeTextDark = TextTheme(
    headline1: StyleText.h1,
    headline2: StyleText.h2,
    bodyText1: StyleText.bodytext1,
    bodyText2: StyleText.bodytext2,
    caption: StyleText.caption,
  ).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  );

  static TextTheme primaryThemeText = themeTextLight.apply(
    bodyColor: Colors.blue,
    displayColor: Colors.blue,
  );

  static TextTheme accentThemeText = themeTextLight.apply(
    bodyColor: Colors.orange,
    displayColor: Colors.orange,
  );
}
