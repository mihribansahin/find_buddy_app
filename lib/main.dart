import 'package:flutter/material.dart';
import 'package:flutter_buddy_app/feature/login/view/login_view.dart';
import 'package:flutter_buddy_app/feature/profile/view/profile_view.dart';
import 'package:flutter_buddy_app/feature/register/view/register_view.dart';
import 'package:flutter_buddy_app/freelance/freelance_test.dart';
import 'package:flutter_buddy_app/product/ui_helper/colors.dart';
import 'package:flutter_buddy_app/product/ui_helper/routes_helper.dart';

void main() {
  runApp(
    MyApp(), // becomes the route named '/'
  );
}

Map<String, WidgetBuilder> routes = {
  RoutesHelper.loginPage: (context) => const LoginView(),
  RoutesHelper.registerPage: (context) => const RegisterView()
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Buddy App',
      routes: routes,
      initialRoute: '/',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          scaffoldBackgroundColor: MyColors.scaffoldBackground,
          primarySwatch: Colors.purple,
          fontFamily: 'Poppins'),
      home: const RegisterView(),
    );
  }
}
