import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  Function onPressed;
  Image buttonIcon;
  SocialButton({Key? key, required this.buttonIcon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 30, right: 30),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 29, 30, 31),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: IconButton(
        onPressed: () => onPressed,
        color: Colors.orange,
        padding: EdgeInsets.all(10.0),
        icon: buttonIcon,
      ),
    );
  }
}
