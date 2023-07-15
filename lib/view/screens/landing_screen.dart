import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/controller/initial_screen_controller.dart';

class LandingScreen extends StatefulWidget {
   LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
     InitialScreenController initialScreenController = Get.put(InitialScreenController());
   @override
  void initState() {
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     initialScreenController.findInitialScreen;
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold();
  }
}