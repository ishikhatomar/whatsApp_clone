import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/app_resources/app_colors.dart';
import 'package:whatsapp_clone/app_resources/app_dimension.dart';
import 'package:whatsapp_clone/app_resources/app_strings.dart';

showAlertDialog({
 
  required String message,
  String? btnText,
}) 
{
 Get.dialog(
        AlertDialog(
          content: Text(
            message,
            style: TextStyle(color: AppColor.grey, fontSize: AppDimension.px15),
          ),
          contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          actions: [
            TextButton(
                onPressed: () => Get.back(),
                child: Text( btnText ??
                  "OK",
                  style: TextStyle(
                    color: AppColor.blue,
                  ),
                ))
          ],
        ),
      );
}
