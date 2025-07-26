import 'package:chat_project_tanuj/app/modules/chat/views/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';


class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    try {
      await authController.login(emailController.text, passwordController.text);
      Get.off(() => ChatScreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void register() async {
    try {
      await authController.register(emailController.text, passwordController.text);
      Get.off(() => ChatScreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login / Register")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: Text("Login")),
            ElevatedButton(onPressed: register, child: Text("Register")),
          ],
        ),
      ),
    );
  }
}
