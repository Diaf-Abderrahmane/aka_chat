// ignore_for_file: prefer_const_constructors

import 'package:aka_chat/components/my_button.dart';
import 'package:aka_chat/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwlController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, this.onTap});

  //register method
  void register() {
    //authentication
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //logo
          Icon(
            Icons.message,
            size: 60,
          ),

          const SizedBox(
            height: 50,
          ),

          //Welcome back message
          Text(
            "Let's get you onboard",
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
          ),

          SizedBox(
            height: 10,
          ),

          //password textfield
          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: _pwlController,
          ),

          SizedBox(
            height: 25,
          ),

          //confirm password textfield
          MyTextField(
            hintText: "Confirm password",
            obscureText: true,
            controller: _confirmPwController,
          ),

          SizedBox(
            height: 25,
          ),

          //login button
          MyButton(
            text: "Register",
            onTap: register,
          ),

          SizedBox(
            height: 25,
          ),

          //register now text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Login now",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
