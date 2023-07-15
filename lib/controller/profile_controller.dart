import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/common/show_alert_dialog.dart';
import 'package:whatsapp_clone/controller/auth_controller.dart';
import 'package:whatsapp_clone/controller/user_controller.dart';
import 'package:whatsapp_clone/model/user_model.dart';
import 'package:whatsapp_clone/view/home_screen.dart';

class ProfileController extends GetxController {
  Rx<TextEditingController> usernameController = TextEditingController().obs;
  UserController _userController = Get.put(UserController());

  Rx<String> _pickedImage = "".obs;
  

  //created getter for picking image
  File? get profilePhoto => File(_pickedImage.value);
  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _pickedImage.value = pickedImage.path;
    } else {
      Get.back();
    }
  }

//upload to firestore
  Future<String> storeFileToFirebase(String ref, var file) async {
    UploadTask? uploadTask;

    final storage = FirebaseStorage.instance;
    if (file is File) {
      uploadTask = storage.ref().child(ref).putFile(file);
    }
    if (file is Uint8List) {
      uploadTask = storage.ref().child(ref).putData(file);
    }

    TaskSnapshot snapshot = await uploadTask!;
    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }

  get saveUserInfoToFirestore async {
    try {
      String uid = FirebaseAuth.instance.currentUser!
          .uid; //ye uid kya hai hum toh number lere hain naok
      String phoneNumber = FirebaseAuth.instance.currentUser!.phoneNumber!; //hn
      String profileImageUrl = "";
      if (profilePhoto != null) {
        //hnn //users_image khn se likhaa
        profileImageUrl =
            await storeFileToFirebase("users_image/$uid", profilePhoto);
      }
      await FirebaseFirestore.instance.collection("users").doc(uid).set(
          UserModel(
              username: usernameController.value.text,
              uid: uid,
              profileImageUrl: profileImageUrl,
              active: true,
              phoneNumber: phoneNumber,
              groupId: []).toJson());
      Get.offAll(HomeScreen());
    } catch (e) {
      showAlertDialog(message: e.toString());
    }
  }
}
