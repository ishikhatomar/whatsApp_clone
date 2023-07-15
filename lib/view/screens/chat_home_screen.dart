import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/app_resources/app_colors.dart';
import 'package:whatsapp_clone/view/screens/contact_page_screen.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.agreeBackgroundColor,
      body: const Center(
        child: Text("chat Home Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(ContactPageScreen());
        },
        backgroundColor: AppColor.secondaryColor,
      child: const Icon(Icons.chat),),
    );
  }
}