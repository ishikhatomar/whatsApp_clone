import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:whatsapp_clone/view/auth/agree_continue_screen.dart';
import 'package:whatsapp_clone/view/screens/landing_screen.dart';
import 'package:whatsapp_clone/view/screens/user_info_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WhatsApp Clone',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: LandingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

