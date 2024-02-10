import 'package:aka_chat/components/my_button.dart';
import 'package:aka_chat/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwlController = TextEditingController();

  LoginPage({super.key});

  //login method
  void login() {
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

          //login button
          MyButton(
            text: "Login",
            onTap: login,
          ),

          SizedBox(
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
              Text(
                "Register now",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
