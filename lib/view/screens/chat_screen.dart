import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/app_resources/app_colors.dart';
import 'package:whatsapp_clone/app_resources/app_dimension.dart';
import 'package:whatsapp_clone/model/user_model.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          borderRadius: BorderRadius.circular(AppDimension.px20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back),
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(user.profileImageUrl),
              ),
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.username,
            style: TextStyle(fontSize: AppDimension.px18,
            color: AppColor.white),
            ),
            const SizedBox(height: AppDimension.px3,),
            Text(
              "last seen 2 min ago",
              style: TextStyle(fontSize: AppDimension.px12),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.video_call),),
           IconButton(onPressed: (){}, icon: Icon(Icons.call),),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),),

        ],
      ),
    );
  }
}
