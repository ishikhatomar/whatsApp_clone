import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/model/user_model.dart';

class ContactController extends GetxController {
  RxList _contact = [].obs;
  List get contact => _contact;

  @override
  void onInit() {
    getAllContacts().then((value) {
      _contact.value = value;
      log("${_contact.value}");
    });
    super.onInit();

  }

 
  Future<List<List>> getAllContacts() async {
    //There are contacts that are saved
    //in the user's phone and have an account on whtspp
    List<UserModel> firebaseContacts = [];
    //There are contacts that are saved
    //in the user's phone and dont have an account on whtspp
    List<UserModel> phoneContacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        final userCollection =
            await FirebaseFirestore.instance.collection('users').get();
        final allContactsInPhone =
            await FlutterContacts.getContacts(withProperties: true);

        bool isContactFound = false;

        for (var contact in allContactsInPhone) {
          for (var firebaseContactData in userCollection.docs) {
            var firebaseContact =
                UserModel.fromSnap(firebaseContactData.data());
            if (contact.phones[0].number.replaceAll("", "") ==
                firebaseContact.phoneNumber) {
              firebaseContacts.add(firebaseContact);
              isContactFound = true;
              break;
            }
          }
          if (!isContactFound) {
            phoneContacts.add(
              UserModel(
                  username: contact.displayName,
                  uid: "",
                  profileImageUrl: "",
                  active: false,
                  phoneNumber: contact.phones[0].number.replaceAll("", ""),
                  groupId: []),
            );
          }
          isContactFound = false;
        }
      }
    } catch (e) {
      log(e.toString());
    }

    return [firebaseContacts, phoneContacts];
  }
}
