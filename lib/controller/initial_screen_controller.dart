import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/controller/user_controller.dart';
import 'package:whatsapp_clone/model/user_model.dart';
import 'package:whatsapp_clone/view/auth/agree_continue_screen.dart';
import 'package:whatsapp_clone/view/home_screen.dart';

class InitialScreenController extends GetxController{
  UserController _userController = Get.put(UserController());

 

 get findInitialScreen async {
    if(FirebaseAuth.instance.currentUser!=null){
      String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot<Map<String, dynamic>> userData =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (userData.exists) {
      _userController.setUserData =
          UserModel.fromSnap(userData.data() as Map<String, dynamic>);
      Get.offAll(HomeScreen());
    } 
    }
    else{
      Get.offAll(AgreeAndContinue());
    }
  }
}