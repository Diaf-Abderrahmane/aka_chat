// ignore_for_file: use_build_context_synchronously

import 'package:aka_chat/services/auth/auth_service.dart';
import 'package:aka_chat/components/my_button.dart';
import 'package:aka_chat/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwlController = TextEditingController();

  //tap to go to register page
  final void Function()? onTap;

  LoginPage({super.key, this.onTap});

  //login method
  void login(BuildContext context) async {
    // auth service class
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _pwlController.text);
    }

    // catch errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          const Icon(
            Icons.message,
            size: 60,
          ),

          const SizedBox(
            height: 50,
          ),

          //Welcome back message
          Text(
            "Welcome Back Man !",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 16),
          ),

          const SizedBox(
            height: 25,
          ),

          //email textfield
          MyTextField(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
            focusNode: null,
          ),

          const SizedBox(
            height: 10,
          ),

          //password textfield
          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: _pwlController,
            focusNode: null,
          ),

          const SizedBox(
            height: 25,
          ),

          //login button
          MyButton(
            text: "Login",
            onTap: () => login(context),
          ),

          const SizedBox(
            height: 25,
          ),

          //register now text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a member?",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  " Register now",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
