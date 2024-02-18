import 'dart:js';

import 'package:aka_chat/services/auth/auth_service.dart';
import 'package:aka_chat/components/my_drawer.dart';
import 'package:aka_chat/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context, snapshot) {
          //error
          if (snapshot.hasError) {
            return const Text("Error");
          }

          //loading

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading..");
          }

          //return listview
          return ListView(
            children: snapshot.data!
                .map<Widget>((userData) => _buildUserListItem())
                .toList(),
          );
        });
  }
}
