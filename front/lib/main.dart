// ignore_for_file: prefer_const_constructors

import 'package:aka_chat/auth/login_or_register.dart';
import 'package:aka_chat/pages/login.dart';
import 'package:aka_chat/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: lightMode,
    );
  }
}
