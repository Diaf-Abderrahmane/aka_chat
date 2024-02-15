// ignore_for_file: prefer_const_constructors

import 'package:aka_chat/auth/auth_gate.dart';
import 'package:aka_chat/auth/login_or_register.dart';
import 'package:aka_chat/firebase_options.dart';
import 'package:aka_chat/pages/login.dart';
import 'package:aka_chat/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: lightMode,
    );
  }
}
