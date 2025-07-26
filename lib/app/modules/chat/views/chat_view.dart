import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../controllers/auth_controller.dart';

class ChatScreen extends StatelessWidget {
  final ChatController controller = Get.find();
  final AuthController authController = Get.find();

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currentUserId = authController.userId!;

    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                reverse: true,
                itemCount: controller.messages.length,
                itemBuilder: (_, index) {
                  final message = controller.messages[index];
                  final isSender = message.senderId == currentUserId;

                  return Align(
                    alignment: isSender
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color:
                        isSender ? Colors.blue[100] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(message.text),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(hintText: 'Type a message...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    controller.sendMessage(messageController.text);
                    messageController.clear();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
