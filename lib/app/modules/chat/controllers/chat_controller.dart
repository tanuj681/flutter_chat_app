import 'package:chat_project_tanuj/app/modules/chat/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class ChatController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthController authController = Get.find();

  var messages = <MessageModel>[].obs;

  late String currentUserId;
  late String receiverId;

  @override
  void onInit() {
    currentUserId = authController.userId!;
    super.onInit();
  }

  String get chatId {
    final ids = [currentUserId, receiverId]..sort();
    return ids.join('_');
  }

  void loadMessages() {
    _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      messages.value = snapshot.docs
          .map((doc) => MessageModel.fromMap(doc.data()))
          .toList();
    });
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    final message = MessageModel(
      text: text.trim(),
      senderId: currentUserId,
      timestamp: DateTime.now(),
    );

    _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message.toMap());
  }
}
