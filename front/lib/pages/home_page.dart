import 'package:aka_chat/auth/auth_service.dart';
import 'package:aka_chat/components/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          //logout button
          IconButton(onPressed: logout, icon: Icon(Icons.logout))
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
