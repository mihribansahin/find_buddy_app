import 'package:flutter/material.dart';

class LoginRegisterAppBar extends AppBar {
  LoginRegisterAppBar({Key? key, required String appBarTitle})
      : super(
          key: key,
          leading: Container(
            margin: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 29, 30, 31),
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
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                size: 15,
              ),
              onPressed: () {
                //  Navigator.pop(context);

                // handle the press
              },
            ),
          ),
          title: Text(
            appBarTitle,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, letterSpacing: 02),
          ),
        );
}
