import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:whatsapp_clone/app_resources/app_colors.dart';
import 'package:whatsapp_clone/app_resources/app_dimension.dart';
import 'package:whatsapp_clone/app_resources/app_strings.dart';
import 'package:whatsapp_clone/view/screens/call_home_screen.dart';
import 'package:whatsapp_clone/view/screens/chat_home_screen.dart';
import 'package:whatsapp_clone/view/screens/status_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.whatsAppbarColor,
          title: const Text(AppString.whatsApp, style: TextStyle(letterSpacing: AppDimension.px1),),
          elevation: 1,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
          ],
          bottom:  const TabBar(
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            splashFactory: NoSplash.splashFactory,
            tabs: [
            Tab(text: AppString.chats,),
            Tab(text: AppString.status,),
            Tab(text: AppString.calls,),
          ]),
          
        ),
        body: TabBarView(
          children: [
            ChatHomeScreen(),
            StatusHomeScreen(),
            CallHomeScreen(),

        ]),
      ),
    );
  }
}