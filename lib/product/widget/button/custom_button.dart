import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../ui_helper/colors.dart';

class MyButton extends StatelessWidget {
  Function()? onTapFunc = () {};
  String? buttonText;
  Widget? buttonChild;

  MyButton(
      {Key? key, required this.onTapFunc, this.buttonText, this.buttonChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 7.0,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: InkWell(
        onTap: onTapFunc,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              MyColors.myBorderColor,
              MyColors.myPink,
            ]),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          height: 50,
          child: buttonChild ??
              Center(
                child: Text(
                  buttonText!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
        ),
      ),
    );
  }
}
