import 'dart:ui';

import 'package:flutter/material.dart';

class MyColors {
  static Color myBorderColor = Colors.purple;
  static Color myFocusedBorderColors = Colors.purple;
  static Color myErrorBorderColor = Colors.red;
  static const outlineInputBorderColor = Color.fromARGB(255, 245, 122, 235);
  static const myYellow = Color.fromARGB(255, 255, 248, 154);
  static const myPink = Color.fromARGB(255, 151, 49, 79);
  static const myPurple = Color.fromARGB(255, 104, 103, 172);
  static const myGrey = Color.fromARGB(255, 79, 79, 83);
}

class Palette {
  static const MaterialColor myPrimaryColor = MaterialColor(
    0xff655D8A, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color.fromARGB(255, 101, 93, 138),
      100: Color.fromARGB(255, 101, 93, 138),
      200: Color.fromARGB(255, 101, 93, 138),
      300: Color.fromARGB(255, 101, 93, 138),
      400: Color.fromARGB(255, 101, 93, 138),
      500: Color.fromARGB(255, 101, 93, 138),
      600: Color.fromARGB(255, 101, 93, 138),
      700: Color.fromARGB(255, 101, 93, 138),
      800: Color.fromARGB(255, 101, 93, 138),
      900: Color(0xff000000), //100%
    },
  );
}
