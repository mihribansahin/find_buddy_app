import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyleOptions {
  static String TITLE = "title";
  static String NORMAL = "normal";
}

class MyTextStyle extends TextStyle {
  MyTextStyle({Key? key, required String textStyleType})
      : super(
            color: TextStyleOptions.TITLE == textStyleType
                ? Colors.white
                : Colors.grey.shade400,
            fontSize: TextStyleOptions.TITLE == textStyleType ? 18 : 13);
}
