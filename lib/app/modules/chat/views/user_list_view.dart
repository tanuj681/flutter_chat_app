import 'package:chat_project_tanuj/app/modules/chat/views/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../controllers/auth_controller.dart';


class UserListScreen extends StatelessWidget {
  final AuthController authController = Get.find();
  final ChatController chatController = Get.put(ChatController());

  // For testing, hardcoded 2 user UIDs
  final otherUserId = 'other_user_uid'; // Replace with actual UID from Firebase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select User to Chat")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            chatController.receiverId = otherUserId;
            chatController.loadMessages();
            Get.to(() => ChatScreen());
          },
          child: Text("Chat with other user"),
        ),
      ),
    );
  }
}
