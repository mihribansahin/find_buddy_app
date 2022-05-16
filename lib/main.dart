import 'package:flutter/material.dart';
import 'package:flutter_buddy_app/feature/login/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Buddy App',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          scaffoldBackgroundColor: Color.fromARGB(255, 29, 30, 31),
          primarySwatch: Colors.purple,
          fontFamily: 'Poppins'),
      home: const LoginView(),
    );
  }
}
