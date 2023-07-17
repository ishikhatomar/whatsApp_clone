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
        ), 
        body: Obx(
          () => contactController.contact.isEmpty
              ? SizedBox()
              : ListView(
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimension.px20,
                        vertical: AppDimension.px20,
                      ),
                      child: Text(
                        "Contacs on Whatsapp",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.grey,
                        ),
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: contactController.contact[0].length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.only(
                            left: AppDimension.px20,
                            right: AppDimension.px10,
                          ),
                          dense: true,
                          leading: CircleAvatar(
                            backgroundColor: AppColor.grey.withOpacity(0.3),
                            radius: AppDimension.px20,
                     
                     
                            child:contactController.contact[0]. profilephoto.isEmpty
                                ? Icon(
                                    Icons.person,
                                    size: 30,
                                    color: AppColor.black,
                                  )
                                : null,
                          ),
                          title: Text(
                            contactController.contact[0][index].username,
                            style: TextStyle(
                              fontSize: AppDimension.px16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            "Hey there! I'm using WhatsApp",
                            style: TextStyle(
                              color: AppColor.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                    Text(
                      "Contacs",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.grey,
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: contactController.contact[1].length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () =>contactController.shareSmsLink(contactController.contact[0].phoneNumber),
                           contentPadding: EdgeInsets.only(
                            left: AppDimension.px20,
                            right: AppDimension.px10,
                          ),
                          dense: true,
                          leading: CircleAvatar(
                            backgroundColor: AppColor.grey.withOpacity(0.3),
                            radius: AppDimension.px20,
                            child: Icon(Icons.person, size: AppDimension.px30, color: AppColor.blue,),

                          ),
                          title: Text(
                            contactController.contact[1][index].username,
                            style: TextStyle(
                              fontSize: AppDimension.px16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                         
                          trailing: TextButton(onPressed: (){},
                          style:TextButton.styleFrom(
                            foregroundColor: AppColor.greenarrow,
                          ) ,
                           child: Text("INVITE"),
                           ),
                        );
                      },
                    ),
                  ],
                ),
        ));
  }//mummy aayi hain 

}
