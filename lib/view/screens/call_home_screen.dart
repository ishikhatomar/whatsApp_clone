import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:whatsapp_clone/app_resources/app_colors.dart';

class CallHomeScreen extends StatelessWidget {
  const CallHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.agreeBackgroundColor,
      body: const Center(
        child: Text("call Home Screen"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      backgroundColor: AppColor.secondaryColor,
      child: const Icon(Icons.call),),
    );
  }
}