import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/app_resources/app_colors.dart';
import 'package:whatsapp_clone/app_resources/app_dimension.dart';
import 'package:whatsapp_clone/app_resources/app_style.dart';
import 'package:whatsapp_clone/controller/contact_controller.dart';
import 'package:whatsapp_clone/model/user_model.dart';

class ContactPageScreen extends StatelessWidget {
  // tumhari bat ho rahi?kyaa
  ContactPageScreen({super.key});
  ContactController contactController = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.whatsAppbarColor,
          leading: BackButton(),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select contact",
                style: AppStyles.fontwhite,
              ),
              SizedBox(
                height: AppDimension.px3,
              ),
              Text(
                "5 contacts",
                style: TextStyle(fontSize: AppDimension.px12),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ), //tum apna krdo expanded me kyu wrap kiyaadono kyunnnlistview ka useok/hnn
        body: Obx(
          () => contactController.contact.isEmpty
              ? SizedBox()
              : ListView(
                  children: [
                    Text("Contacs on Whatsapp"),
                    Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: contactController.contact[0].length,
                        itemBuilder: (context, index) {
                          return Text(
                            contactController.contact[0][index].username,
                          );
                        },
                      ),
                    ),
                    Text("Contacs"),
                    Expanded(
                      child: ListView.builder(
                         physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: contactController.contact[1].length,
                        itemBuilder: (context, index) {
                          return Text(
                            contactController.contact[1][index].username,
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ));
  }
}
