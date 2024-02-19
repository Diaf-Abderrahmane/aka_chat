// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'dart:html';
import 'dart:js';

import 'package:aka_chat/components/my_textfield.dart';
import 'package:aka_chat/services/auth/auth_service.dart';
import 'package:aka_chat/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  // text controller
  final TextEditingController _messageController = TextEditingController();

  // chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // send message function
  void sendMessage() async {
    // send only if not empty
    if (_messageController.text.isNotEmpty) {
      // send the message
      await _chatService.sendMessage(receiverID, _messageController.text);

      // clear the controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          // display all messages
          Expanded(child: _buildMessageList()),

          // user input
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(senderID, receiverID),
        builder: (context, snapshot) {
          // errors
          if (snapshot.hasError) {
            return const Text("Error");
          }

          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading..");
          }

          //return List view
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageListItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageListItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Text(data["messages"]);
  }

  // build message input UI
  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
            child: MyTextField(
                hintText: "Type a message",
                obscureText: false,
                controller: _messageController)),
        IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_upward))
      ],
    );
  }
}
