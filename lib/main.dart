import 'package:animation_app_flutter/pages/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.white,
              secondary: Color.fromRGBO(247, 64, 106, 1.0))),
      home: LoginScreen(),
    );
  }
}
