import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whatsapp_clone/app_resources/app_colors.dart';
import 'package:whatsapp_clone/app_resources/app_dimension.dart';
import 'package:whatsapp_clone/app_resources/app_strings.dart';
import 'package:whatsapp_clone/app_resources/app_style.dart';
import 'package:whatsapp_clone/controller/profile_controller.dart';
import 'package:whatsapp_clone/view/auth/widget/custom_text_field.dart';

class UserInfoScreen extends StatelessWidget {
  UserInfoScreen({super.key});  
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.agreeBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.agreeBackgroundColor,
        elevation: 0,
        title: Text(
          "Profile info",
          style: AppStyles.fontwhite,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppDimension.px20),
        child: Column(
          children: [
            Text(
              AppString.providePhotoName,
              textAlign: TextAlign.center,
              style: AppStyles.grey,
            ),
            const SizedBox(
              height: AppDimension.px40,
            ),
            Obx(
              () => InkWell(
                onTap: () => profileController.pickImage(),
                child: Container(
                  padding: const EdgeInsets.all(AppDimension.px26),
                  decoration: profileController.profilePhoto!.path.isNotEmpty
                      ? BoxDecoration(
                        //han
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image: FileImage(
                                  File(profileController.profilePhoto!.path))),
                          shape: BoxShape.circle,
                          color: AppColor.photoIconBgColor,
                        )
                      : BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.photoIconBgColor,
                        ),
                  child: profileController.profilePhoto!.path.isEmpty
                      ? Icon(
                          Icons.add_a_photo_rounded,
                          color: AppColor.photoIconColor,
                          size: AppDimension.px48,
                        )
                      : SizedBox(),
                ),
              ),
            ),
            const SizedBox(
              height: AppDimension.px40,
            ),
            Row(
              children: [
                const SizedBox(
                  width: AppDimension.px20,
                ),
                Expanded(
                    child: CustomTextField(
                  controller: profileController.usernameController.value,
                  hintText: AppString.typeYourNameHere,
                  textAlign: TextAlign.left,
                  autoFocus: true,
                )), // in Row widget is TextFormField is not wrapped in expanded then error will be shown
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: AppColor.photoIconColor,
                ),
                const SizedBox(
                  width: AppDimension.px20,
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: AppDimension.px90,
        child: ElevatedButton(
            onPressed: () {
              profileController.saveUserInfoToFirestore;
            },
            style:
                ElevatedButton.styleFrom(backgroundColor: AppColor.greenarrow),
            child: Text(AppString.next)),
      ),
    );
  }
}
